#!/bin/bash
#
# libsay
# terminal_test.sh - Version: 1.1-202209.21.180000
# See what your terminal can do.
# This will show what your terminal is able to do with Escape Characters
# for text effects and colours.
#
# Author:       Megaf - https://github.com/Megaf - mmegaf [at] gmail [dot] com
# Date:         21/09/2022
# GitHub:       https://github.com/Megaf/libsay
# License:      GPL V3
# TODO: Add md5 to check if test succeeded.
# Prints the ASCII table.

start_timer()
{
  start=""
  start="$(date +%s.%3N)"
}

end_timer()
{
  end="$(date +%s.%3N)"
  total_time="$(echo "scale=3; $end - $start" | bc)"
  echo "It took $total_time seconds to run the tests."
}

ascii_test()
{
    echo "Printing the ASCII table."
    print_ascii()
    {
        command=$(printf %x "$i")
        printf "%sASCII code $i: "; printf "'"; echo -n -e "\x$command"; printf "'\n"
    }

    for i in {32..126}; do
        print_ascii "$i"
    done
    unset -v character command i

    for i in {128..254}; do
        print_ascii "$i"
    done
    unset -v character command i
    unset -f print_ascii
}

# Test terminals capabilities for text effects via Escape Characters.
terminal_test()
{
    local run_amount run_number

    echo "Testing terminal's capabilities."
    print_test()
    {
        printf "\e[0m\n"; echo -n -e "\e[""$run_number""m"
        printf "Text example."; printf "\e[0m\n"
        printf "\n"
    }

    run_amount="128" # Total number of "effects" to try.
    run_number="0"

    printf "Testing text effects.\n"
    while [ "$run_number" -le "29" ]; do
        printf '%s' "Effect number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    printf "Testing normal foreground colours.\n"
    while [ "$run_number" -le "39" ]; do
        printf '%s' "Colour number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    printf "Testing normal background colours.\n"
    while [ "$run_number" -le "49" ]; do
        printf '%s' "Colour number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    printf "Testing aditional text effects.\n"
    while [ "$run_number" -le "89" ]; do
        printf '%s' "Effect number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    printf "Testing light foreground colours.\n"
    while [ "$run_number" -le "99" ]; do
        printf '%s' "Colour number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    printf "Testing light background colours.\n"
    while [ "$run_number" -le "109" ]; do
        printf '%s' "Colour number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    printf "Testing aditional extra effects.\n"
    while [ "$run_number" -le "$run_amount" ]; do
        printf '%s' "Effect number: $run_number"
        print_test
        run_number="$((++run_number))"
    done

    unset -v run_amount run_number
    unset -f print_test f
}

libsay_test()
{
  local test_message debug
  # shellcheck source=/dev/null
  source libsay
  say "TITLE: The following test uses libsays's functions."
  draw do_godown
  debug="false";
  say "NOTICE: 'debug=$debug'"
  read -r -d '' test_message << EOM
TITLE: Multiline Message.

A normal unformatted text.
NOTICE: Please notice this!
WARNING: I'm warning you...
ERROR: Nothing wrong happened.

INFO: The line below this one is a DEBUG one.
DEBUG: Last line, DEBUG message.
EOM

  rst; say "$test_message"; rst
  draw do_godown
  debug="true";
  say "NOTICE: 'debug=$debug'"
  rst; say "$test_message"; rst
  unset -v test_message debug

  draw do_godown
  say "TITLE: Testing text formating using libsay's '_on' functions."
  rst; printf '%s' "                      underline - "; underline_on;         echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "             squiggly underline - "; wavy_underline_on;    echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "               double underline - "; double_underline_on;  echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                       overline - "; overline_on;          echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "         underline and overline - "; overunder_on;         echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "underline and squiggly overline - "; overuwavynder_on;     echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                           bold - "; bold_on;              echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                       inverted - "; invert_on;            echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                       blinking - "; blink_on;             echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                        italics - "; italics_on;           echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                 strike-through - "; crossout_on;          echo -e "This is a testing text.\n"; rst
  rst; printf '%s' "                          faded - "; fade_on;              echo -e "This is a testing text.\n"; rst
}

__all_tests() { terminal_test && ascii_test && libsay_test; }

help_menu()
{
  echo "┌──────────────────────────────────────────────────────┐"
  echo "| Please run './terminal_test test_name'.              |"
  echo "| Where 'test name' is one of the following:           |"
  echo "├─────────────────┬────────────────────────────────────┤"
  echo "|    Test Name    |           Description              |"
  echo "├─────────────────┼────────────────────────────────────┤"
  echo "| 'terminal_test' | Tests your termina's capabilities. |"
  echo "|    'ascii_test' | Prints the ASCII Table.            |"
  echo "|   'libsay_test' | Tests the libsay library.          |"
  echo "|           'all' | Runs all of the above.             |"
  echo "└─────────────────┴────────────────────────────────────┘"
}

case "$*" in
  terminal_test)  start_timer; terminal_test; end_timer  ;;
     ascii_test)  start_timer;    ascii_test; end_timer  ;;
    libsay_test)  start_timer;   libsay_test; end_timer  ;;
            all)  start_timer;   __all_tests; end_timer  ;;
              *)                              help_menu  ;;
esac

unset -v start end total_time
unset -f terminal_test ascii_test libsay_test help_menu start_timer end_timer

exit 0
