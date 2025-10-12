+++
title = "HOWTO: See SOME lines from a file"
author = ["George M Jones"]
publishDate = 2020-09-01
lastmod = 2025-10-12T09:55:29-04:00
tags = ["geek", "unix", "100DaysToOffload", "HOWTO"]
categories = ["blog"]
draft = false
+++

Sometimes you want to see the head of a file.   Sometimes you want to
see the tail. Sometimes you just want to see **some** lines from a file.

The bash function below gives you **some** lines:

```text
gmj@ed bash [master] $ cat <<END > lines.txt
> 1
> 2
> 3
> 4
> 5
> 6
> 7
> 8
> 9
> 10
> 11
> 12
> 13
> 14
> 15
> END
gmj@ed bash [master] $ source some.t
sh
gmj@ed bash [master] $
gmj@ed bash [master] $ some -2 lines.txt
14
15
gmj@ed bash [master] $ some -2 lines.txt
9
10
gmj@ed bash [master] $ some -2 lines.txt
6
7
gmj@ed bash [master] $ cat some.sh
```

<!--more-->

```bash
function some {
    # Functon to print "some" lines of a file, like head or tail but, random start
    #
    # Usage: some [[-#] FILE]

    set -u; # be safe out there

    HOW_MANY=10 # Number of lines to print.  Default.
    FILE="/dev/stdin" # default


    if [ "$#" -eq 0 ]; then
        :
    elif [ "$#" -eq 1 ]; then
        if [[ "$1" =~ -[0-9] ]]; then
            HOW_MANY=`echo "$1" | sed 's/^-//'`
        else
            FILE="$1"
        fi

    elif [ "$#" -eq 2 ]; then
        if [[ "$1" =~ -[0-9] ]]; then
            HOW_MANY=`echo "$1" | sed 's/^-//'`
        else
            echo "some: Usage: some [-# [FILE]]"
            return
        fi

        FILE="$2"
    fi

    # Count the lines to bound display
    LINES=`wc -l $FILE | sed -e 's/ .*//'`

    # pick a random starting line at least HOW_MANY back from the end
    FIRST=$((1 + RANDOM % (LINES - HOW_MANY + 1 )))
    LAST=$((FIRST + HOW_MANY - 1))

    # Let's see some lines !
    awk "NR >= $FIRST && NR <= $LAST" $FILE
}
```

Post 26 #100DaysToOffload <https://100daystooffload.com/>
