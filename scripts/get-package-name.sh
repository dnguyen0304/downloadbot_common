#!/usr/bin/env bash

set -eu

echo $(grep -Po "package_name = '\K[\w.]+" setup.py)
