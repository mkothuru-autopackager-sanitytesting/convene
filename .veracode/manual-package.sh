#!/bin/bash
set -e
cd $(dirname "$0") >/dev/null 2>&1
repo_root=`git rev-parse --show-toplevel`
output_dir="$repo_root/.veracode/output/manual"
proj_name=`git remote get-url origin | awk -F'/' '{split($(NF-0), name, "."); print name[1]}'`
zip_file="$proj_name.zip"

cd $repo_root

npm install

mkdir -p $output_dir

( cd "$repo_root" && find . -type f \( \
    -name "package.json" -o \
    -name "package-lock.json" -o \
    -name "*.asp" -o \
    -name "*.css" -o \
    -name "*.ehtml" -o \
    -name "*.es" -o \
    -name "*.es6" -o \
    -name "*.handlebars" -o \
    -name "*.hbs" -o \
    -name "*.hjs" -o \
    -name "*.htm" -o \
    -name "*.html" -o \
    -name "*.js" -o \
    -name "*.jsx" -o \
    -name "*.json" -o \
    -name "*.jsp" -o \
    -name "*.map" -o \
    -name "*.mustache" -o \
    -name "*.php" -o \
    -name "*.ts" -o \
    -name "*.tsx" -o \
    -name "*.vue" -o \
    -name "*.xhtml" \) \
    | grep -v './node_modules/' \
    | xargs zip "$output_dir/$zip_file" -@ )
