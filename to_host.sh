#!/bin/bash
ROOT=src/ #folder in repo relative to this script where everything is
DRY_RUN=0

function unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}

# recursive function for finding files in repo, then copying from host to overwrite repo
copy_to_host() {
	dir=$1
	repo_path=$2
	host_path=$3
	
	for f in "$dir"* "$dir".[^.]*; do
		if [ -d "$f" ];then
			host_path=$host_path/${f##*/}
			repo_path=$repo_path/${f##*/}
			copy_to_host "$f/" "$repo_path" "$host_path"
    elif [ -f "$f" ]; then
			echo "  $host_path/${f##*/}"
			statement="cp \"$ROOT$repo_path/${f##*/}\" \"$host_path/${f##*/}\""
			if [ $DRY_RUN -eq 1 ]; then
				echo "    dry run: $statement"
			else
				eval $statement "DO IT!"
			fi
    fi
	done
}

confirm () {
    # call with a prompt string or use a default
    read -r -p "${1:-Are you sure? [y/N]} " response
    case $response in
        [yY][eE][sS]|[yY]) 
            true
            ;;
        *)
            false
            ;;
    esac
}

# look through folders in /src
# for each dir with a matching local var set by msysgit(USERPROFILE)
main() {
	for dir in $ROOT*/ ; do
		windows_path_var=${dir%/}
		repo_path=${windows_path_var#$ROOT}
		expanded_windows_path=${!repo_path}
		host_path=$(unixpath "$expanded_windows_path")
		echo "$repo_path: $host_path"
		copy_to_host "$dir" "$repo_path" "$host_path"
	done
}

echo "Dotfiles windows config management: update local from repo"
echo "  specify -d for dry-run to see what would be copied, but do nothing"
while getopts d FLAG; do
  case $FLAG in
    d)  #set option "d"
      DRY_RUN=1
      echo "execute dry run only"
      ;;
	esac
done

if [ $DRY_RUN -eq 1 ]; then
  main
else
	confirm "Do you really want to override local host files with those from the repo?[y/N]" && main $DRY_RUN
fi
