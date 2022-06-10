#! /bin/bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

./test/bats/bin/bats "$SCRIPT_DIR"/test/*.bats
