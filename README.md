# png-graph-generator
Script for generating a png graph of a programm.

Uses [gprof2dot](https://github.com/jrfonseca/gprof2dot) to convert the callgrind output to a png graph


# Usage:
  graph.sh [*your_program*] [program_arguements]

# Requirements

  * [Python](http://www.python.org/download/): known to work with version 2.7 and 3.3; it will most likely _not_ work with earlier releases.
  * [Graphviz](http://www.graphviz.org/Download.php): tested with version 2.26.3, but should work fine with other versions.
  

## Windows users

  * Download and install [Python for Windows](http://www.python.org/download/)
  * Download and install [Graphviz for Windows](http://www.graphviz.org/Download_windows.php)

## Debian/Ubuntu users

  * Run:

        apt-get install python graphviz


# Download

  * [PyPI](https://pypi.python.org/pypi/gprof2dot/)

        pip install gprof2dot

  * [Standalone script](https://raw.githubusercontent.com/jrfonseca/gprof2dot/master/gprof2dot.py)

  * [Git repository](https://github.com/jrfonseca/gprof2dot)


