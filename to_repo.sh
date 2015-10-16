#!/bin/bash
ROOT=src/ #folder in repo relative to this script where everything is

function unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}

# recursive function for finding files in repo, then copying from host to overwrite repo
copy_to_repo() {
	dir=$1
	repo_path=$2
	host_path=$3
	
	for f in "$dir"* "$dir".[^.]*; do
		if [ -d "$f" ];then
			host_path=$host_path/${f##*/}
			repo_path=$repo_path/${f##*/}
			copy_to_repo "$f/" "$repo_path" "$host_path"
    elif [ -f "$f" ]; then
			echo "  $host_path/${f##*/}"
			eval "cp \"$host_path/${f##*/}\" \"$ROOT$repo_path/${f##*/}\""
    fi
	done
}

# look through folders in /src
# for each dir with a matching local var set by msysgit(USERPROFILE)
for dir in $ROOT*/ ; do
	windows_path_var=${dir%/}
	repo_path=${windows_path_var#$ROOT}
	expanded_windows_path=${!repo_path}
	host_path=$(unixpath "$expanded_windows_path")
	echo "$repo_path: $host_path"
	copy_to_repo "$dir" "$repo_path" "$host_path"
done

