#!/bin/bash

valgrind --log-file=valgrind_output --tool=callgrind --callgrind-out-file=callgrind_output "${@}"
/usr/local/bin/gprof2dot --format=callgrind --output=out.dot ./callgrind_output
out=""
for arg in "${@}"
do
	out="$out$arg"
done
out="$out.png"
dot -Tpng out.dot -o "$out"
rm callgrind_output
rm out.dot
rm valgrind_output

echo
echo "graph drawn in $out"
