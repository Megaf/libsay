#!/bin/bash
#
# libsay_bench.sh
# Simple libsay benchmark.
#
# Author: Megaf - https://github.com/Megaf/ - mmegaf [at] gmail [dot] com
# Date: 14/09/2022
# License: GPL 3
# URL/GitHub: https://github.com/Megaf/libsay/
#
# Usage:
# './libsay_bench.sh' to run it with the defaut 50 runs set.
# './libsay_bench.sh n' where n is the number of runs you want to try.

clear
if [ ! "$(which tput)" ]; then
    echo "'tput' was not found."
    echo "libsay and this benchmark depends on 'tput'."
    echo "Please install it using your distros package manager."
    exit 1
fi
tput reset

is_libsay="$(find . -name libsay | grep libsay | head -n 1)"
if [ "$is_libsay" ]; then
    source "$is_libsay"
    say "INFO: libsay loaded! :)"
else
    libsay_url="https://github.com/Megaf/libsay/releases/download/0.01/libsay"
    libsay_destination="$HOME/Downloads"
    echo "Couldn't find libsay anywhere close to this benchmark."
    echo "Trying to download it."
    if [ "$(which axel)" ]; then
        axel -n 9 "$libsay_url" -o "$libsay_destination/libsay"
        [ ! "$?" = 0 ] && echo "Couldn't download libsay, please try again later." && exit 1
    elif [ "$(which wget)" ]; then
        wget -c "$libsay_url" -O "$libsay_destination/libsay"
        [ ! "$?" = 0 ] && echo "Couldn't download libsay, please try again later." && exit 1
    else
        echo "Couldn't download libsay."
        echo "Please manually download it from https://github.com/Megaf/libsay"
        echo "and add it from the same dir this benchmark is located."
        exit 1
    fi
    source $libsay_destination/libsay && say "INFO: libsay downloaded and loaded! :)"
fi

say << EOM
TITLE: libsay Benchmark
INFO: Welcome to the libsay Benchmark!

Just a simple benchmark to test the lib's
performance on your system.
EOM

say "NOTICE: Please press any key to start the benchmark or 'Ctrl c' to quit."
read -n 1 -s

clear
tput reset
start="$(date +%s.%3N)"
debug=true
[ -z "$*" ] && runs=50 || runs="$*"
tput sc
read -r -d '' text << EOM
TITLE: libsay Benchmark
Welcome to the libsay Benchmark!
INFO: This benchmark will test the
INFO: performance of your system by
INFO: timing how long it takes to
INFO: print all the text in here.

NOTICE: This is a single core bench.
WARNING: This is not very serious.

DBG: Is there a Debug mode?
DEBUG: Debug message!
ERROR: Nothing went wrong! All good!
EOM

read -r -d '' bench << EOM
NOTICE: Benchmark is already running!
WARNING: Please don't touch anything!
INFO: This message will be printed
INFO: $runs times!
EOM

t=0
while [ "$t" -lt "$runs" ]; do
    tput rc
    say "$text"
    say "$bench"
    t="$((t+1))"
    tp="$((t*100))"
    p="$(expr $tp / $runs)"
    bar="$(expr $p / 10)"
    printf '%s' "Progress: |" && printf "%0.s=" $(seq 1 "$bar"); printf '%s' ">$p%"
done
end="$(date +%s.%3N)"
total_time="$(echo "scale=3; $end - $start" | bc)"
echo ""
say "INFO: All done"
say "NOTICE: The benchmark took '$total_time' seconds."
unset start end text t runs debug total_time tp p bar libsay_url libsay_destination

exit 0

