#!/bin/bash
function my_unixpath() {
    echo "$1" \
    | sed -r \
      -e 's/\\/\//g' \
      -e 's/^([^:]+):/\/\1/'
}

# look through folders in /src
for d in src/*/ ; do
	path_var=${d%/}
	path_var=${path_var#src/}
	expanded_path=${!path_var}
	unix_path=$(my_unixpath "$expanded_path")
	echo "src=$path_var windows=$expanded_path unix=$unix_path"
	for f in "$d"* ; do
		echo "  ${f##*/}"
		echo "    cp $unix_path/${f##*/} src/$path_var/${f##*/}"
		eval "cp \"$unix_path/${f##*/}\" \"src/$path_var/${f##*/}\""
	done
done
# for each dir with a matching local var set by msysgit(USERPROFILE)
# for each file in the repo
# find the local system file that matches
# overwrite the repo file with the local system file	


