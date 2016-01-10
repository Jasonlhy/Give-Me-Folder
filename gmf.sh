#!/bin/zsh

# first argument is the separator
if [ -n "$1" ]; then
    sep="$1"
else
    echo "no default separator, set to ,"
    sep=","
fi

# loop all file in the current directory
for file in * ; do
    # it is a file only, not a directory
    if [ ! -d "$file" ]; then
        IFS="$sep"
        finalName="$file"
        basePath=""

        # read the file name by separator
        read -ra names <<< "$file"

        # parse the file name
        # by reading the file name token one by one
        # build the base path and extract the final filename
        lastIdx=$(( ${#names[*]} - 1 ))
        if [[ $lastIdx > 0 ]]; then
            # need to unset, otheriwse the for loop below will be affect by IFS
            unset IFS;

            for i in $(seq 0 $lastIdx); do
                if [ $i == $lastIdx ]; then
                    finalName=${names[$i]}
                else
                    basePath=$basePath${names[$i]}"/"
                fi
            done

            dest=$basePath$finalName
            # echo "finalName: $finalName"
            # echo "basePath: $basePath"
            # echo "dest: $dest"

            # create intermediate folder if needed
            # and move file to the destination
            mkdir -p "$basePath"
            mv "$file" "$dest"
            echo "move $file to $dest"
        fi
    fi
done

echo "DONE !"
