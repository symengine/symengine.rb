#!/bin/bash

find ext/symengine/ -iname *.h -o -iname *.c | xargs clang-format-3.7 -style=file -i
