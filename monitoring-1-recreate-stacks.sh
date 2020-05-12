#/bin/sh

set -e -u -o pipefail

sh ./monitoring-1-delete-stacks.sh
sh ./monitoring-1-create-stacks.sh