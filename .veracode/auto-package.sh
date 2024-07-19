#!/bin/bash
set -e

# Determine source and target directories.
pushd $(dirname "$0") >/dev/null 2>&1
repo_root=`git rev-parse --show-toplevel`
output_dir="$repo_root/.veracode/output/auto"
popd

# Run the packager.
veracode package --source $repo_root --type directory --output $output_dir --trust
