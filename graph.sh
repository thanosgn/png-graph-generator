#!/bin/bash
if [ "$#" -eq 0 ] ; then
  echo "You didn't provide a program"
  exit 1
else
	pid="$$"
	valgrind_output="/tmp/valgrind_output$pid"
	callgrind_output="/tmp/callgrind_output$pid"
	out_dot="/tmp/out.dot$pid"
	valgrind --log-file=$valgrind_output --tool=callgrind --callgrind-out-file=$callgrind_output "${@}"
	
	status=$?
	
	if [ $status -ne 0 ]; then
        echo "Cannot create graph for ${@}"
        exit 1
    fi
	/usr/local/bin/gprof2dot --format=callgrind --output=$out_dot $callgrind_output

	out=""
	for arg in "${@}"
	do
		out="$out$arg"
	done
	if git rev-parse --git-dir > /dev/null 2>&1; then
		branch="$(git symbolic-ref --short -q HEAD)"
		out="$out--$branch"
	fi

	out="$out.png"
	dot -Tpng $out_dot -o "$out"
	rm $callgrind_output
	rm $out_dot
	rm $valgrind_output

	echo
	echo "graph drawn in $out"

	eog $out &
	
fi

