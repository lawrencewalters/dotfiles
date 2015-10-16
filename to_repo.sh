#!/bin/bash
function my_unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}

recurse() {
 for i in "$1"/*;do
    if [ -d "$i" ];then
        echo "dir: $i"
        recurse "$i"
    elif [ -f "$i" ]; then
        echo "file: $i"
    fi
 done
}

copy_files() {
	dir=$1
	path_var=$2
	unix_path=$3
	#echo "$dir $path_var $unix_path"
	# find the local system file that matches
	# for each file in the repo
	
	for f in "$dir"* "$dir".[^.]*; do
		if [ -d "$f" ];then
			unix_path=$unix_path/${f##*/}
			path_var=$path_var/${f##*/}
			copy_files "$f/" "$path_var" "$unix_path"
    elif [ -f "$f" ]; then
			echo "  $unix_path/${f##*/}"
			#echo "    cp \"$unix_path/${f##*/}\" \"src/$path_var/${f##*/}\""
			# overwrite the repo file with the local system file	
			eval "cp \"$unix_path/${f##*/}\" \"src/$path_var/${f##*/}\""
    fi
	done
}

# look through folders in /src
# for each dir with a matching local var set by msysgit(USERPROFILE)
for dir in src/*/ ; do
	path_var=${dir%/}
	path_var=${path_var#src/}
	expanded_path=${!path_var}
	unix_path=$(my_unixpath "$expanded_path")
	echo "$path_var: $unix_path"
	# find the local system file that matches
	# for each file in the repo
	copy_files "$dir" "$path_var" "$unix_path"
done

