#! /bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

fd . | entr "$SCRIPT_DIR/run_bash_tests.bash"
