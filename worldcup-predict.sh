#!/bin/bash

# Usage message
usage() {
    local PROGNAME="worldcup-predict"
    cat <<- EOF
	Animals predict World cup result.
	Usage: $PROGNAME <Team1> <Team2> [--animal <Animal_name>]

	Animal_name: tux (default), dinosaur, cow, cock.

	Examples:
       $PROGNAME Brazil England        
       $PROGNAME Brazil England --animal cow
       
	EOF
}

# Show Tux 
tux() {
    echo "       \\"
    echo "        \\"
    echo "         \\"
    echo "            .--."
    echo "           |o_o |"
    echo "           |:_/ |"
    echo "          //   \ \\"
    echo "         (|     | )"
    echo "        /'\_   _/\`\\"
    echo "        \\___)=(___/"
}

# Show Dinosaur
dinosaur() {
    echo "        \\                         .       ."
    echo "         \\                       / \`.   .' \" "
    echo "          \\              .---.  <    > <    >  .---."
    echo "           \\             |    \\  \\ - ~ ~ - /  /    |"
    echo "             _____          ..-~             ~-..-~"
    echo "            |     |   \\~~~\\.'                    \`./~~~/"
    echo "           ---------   \\__/                        \\__/"
    echo "          .'  O    \\     /               /       \\  \" "
    echo "         (_____,    \`._.'               |         }  \\/~~~/"
    echo "          \`----.          /       }     |        /    \\__/"
    echo "                \`-.      |       /      |       /      \`. ,~~|"
    echo "                    ~-.__|      /_ - ~ ^|      /- _      \`..-'   "
    echo "                         |     /        |     /     ~-.     \`-. _  _  _"
    echo "                         |_____|        |_____|         ~ - . _ _ _ _ _>"
}

# Show Cow
cow() {
    echo "      \\"
    echo "       \\"
    echo "        \\ ^__^"
    echo "          (oo)\\_______"
    echo "          (__)\\       )\\/\\"
    echo "              ||--WWW |"
    echo "              ||     ||"
}

# Show Cock
cock() {
    echo "       \\"
    echo "        \\"
    echo "         \\  /\\/\\"
    echo "           \\   /"
    echo "           |  0 >>"
    echo "           |___|"
    echo "     __((_<|   |"
    echo "    (          |"	
    echo "    (__________)"	
    echo "       |      |"
    echo "       |      |"
    echo "       /\\     /\\"
}

# Predict result of a match
predict() {
    local number=$(( ( RANDOM % 3 ) + 1 ))
    local result=""
    if [[ $number == 1 ]]; then
        result="$1 > $2"
    elif [[ $number == 2 ]]; then
        result="$1 = $2"
    else
        result="$1 < $2"
    fi
    echo $result
}

# Show result message
msg_box() {
    local msg_result=$(predict $1 $2)
    local msg_len=${#msg_result}
    local line1=$(for (( i = 0; i <= $msg_len + 1; i++ ));\
                    do printf "%s" "_";\
                done;\
                printf "\n")
    local line2=$(for (( i = 0; i <= $msg_len + 1; i++ ));\
                    do printf "%s" "-";\
                done;\
                printf "\n")
    echo "  $line1"
    echo " | $msg_result |"
    echo "  $line2"
}

# Main program
main() {
    if [[ $# == 0 ]]; then
        usage
    else
        # Show result message
        msg_box $1 $2
        
        # Then show animal
        if [[ $# != 4 ]] || [[ $4 = "tux" ]]; then
            tux
        elif [[ $4 = "dinosaur" ]]; then
            dinosaur
        elif [[ $4 = "cow" ]]; then
            cow
        elif [[ $4 = "cock" ]]; then
            cock
        fi
    fi
}

main $1 $2 $3 $4

