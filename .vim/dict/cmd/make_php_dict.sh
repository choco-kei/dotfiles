#!/bin/sh

ls function.* | sed 's/^function\.\([-_a-z0-9.]*\)\.html$/\1/' | sed 's/-/_/g' | sed 's/\./->/g' | sort

