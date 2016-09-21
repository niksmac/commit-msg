#!/bin/bash

filename="$1"
lineno=0

error() {
    echo "$1"
    exit 1
}

while read -r line
do
    # Ignore comment lines (don't count line number either)
    [[ "$line" =~ ^#.* ]] && continue

    let lineno+=1
    length=${#line}

    # Subject line tests
    if [[ $lineno -eq 1 ]]; then
        [[ $length -gt 50 ]] && error "Limit the subject line to 50 characters"
        [[ ! "$line" =~ ^[A-Z].*$ ]] && error "Capitalise the subject line"
        [[ "$line" == *. ]] && error "Do not end the subject line with a period"
    fi

    # Rules related to the commit message body
    [[ $lineno -eq 2 ]] && [[ -n $line ]] && error "Separate subject from body with a blank line"
    [[ $lineno -gt 1 ]] && [[ $length -gt 72 ]] && error "Wrap the body at 72 characters"
done < "$filename"
exit 0
