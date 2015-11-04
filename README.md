# Sequences

A solution to https://gist.github.com/pedromartinez/7788650

Finds sequences of letters (`/[A-Za-z]/`) - excluding, for example, numbers, apostrophes, period and ampersands.

`cat /usr/share/dict/words | bin/sequences` to use as a script. Optionally, set `OUTPUT_DIR` environment variable.
