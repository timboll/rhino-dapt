#!/bin/sh
set -eu
cd "$(dirname "$0")/.."
export PYTHONPATH='/Applications/oMLX.app/Contents/Resources/Python/framework-mlx-base/lib/python3.11/site-packages'
exec '/Applications/oMLX.app/Contents/Resources/Python/cpython-3.11/bin/python3.11' scripts/tokenize.py
