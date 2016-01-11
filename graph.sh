#!/bin/bash

valgrind --log-file=valgrind_output --tool=callgrind --callgrind-out-file=callgrind_output "${@}"
/usr/local/bin/gprof2dot --format=callgrind --output=out.dot ./callgrind_output
out=""
for arg in "${@}"
do
	out="$out$arg"
done

if git rev-parse --git-dir > /dev/null 2>&1; then
	branch="$(git symbolic-ref --short -q HEAD)"
	out="$out|$branch"
fi

out="$out.png"
dot -Tpng out.dot -o "$out"
rm callgrind_output
rm out.dot
rm valgrind_output

echo
echo "graph drawn in $out"

eog $out &
