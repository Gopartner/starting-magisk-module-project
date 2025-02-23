#!/bin/bash

print_info() { echo -e "\e[34m[INFO]\e[0m $1"; }
print_success() { echo -e "\e[32m[SUCCESS]\e[0m $1"; }
print_error() { echo -e "\e[31m[ERROR]\e[0m $1"; }

create_directory_structure() {
    local MODULE_PATH="$1"
    mkdir -p "$MODULE_PATH/system/bin"
    mkdir -p "$MODULE_PATH/system/etc"
    mkdir -p "$MODULE_PATH/ui/overlay"
    mkdir -p "$MODULE_PATH/app/src"
}

write_config() {
    local FILE_PATH="$1"
    shift
    printf "%s\n" "$@" > "$FILE_PATH"
}

