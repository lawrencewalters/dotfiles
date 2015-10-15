#!/bin/bash
function my_unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}

# look through folders in /src
# for each dir with a matching local var set by msysgit(USERPROFILE)
#TODO: capture hidden files
for d in src/*/ ; do
	path_var=${d%/}
	path_var=${path_var#src/}
	expanded_path=${!path_var}
	unix_path=$(my_unixpath "$expanded_path")
	echo "src=$path_var windows=$expanded_path unix=$unix_path"
	# find the local system file that matches
	# for each file in the repo
	for f in "$d"* "$d".[^.]*; do
		# TODO: recurse into directories here!
		echo "  ${f##*/}"
		echo "    cp \"$unix_path/${f##*/}\" \"src/$path_var/${f##*/}\""
		# overwrite the repo file with the local system file	
		eval "cp \"$unix_path/${f##*/}\" \"src/$path_var/${f##*/}\""
	done
done


