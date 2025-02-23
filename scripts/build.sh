#!/bin/bash

source scripts/utils.sh
source scripts/features.sh
source scripts/input.sh

build_module() {
    MODULE_PATH="results/$MODULE_NAME"
    print_info "Membangun struktur modul di: $MODULE_PATH"
    create_directory_structure "$MODULE_PATH"

    print_info "Menulis konfigurasi module.prop"
    write_config "$MODULE_PATH/module.prop" \
        "id=$MODULE_ID" \
        "name=$MODULE_NAME_FULL" \
        "author=$MODULE_AUTHOR" \
        "description=$MODULE_DESC" \
        "version=$MODULE_VER" \
        "versionCode=$MODULE_VER_CODE"

    if [[ "$MODULE_REBOOT" == "y" ]]; then
        echo "reboot=true" >> "$MODULE_PATH/module.prop"
    fi

    # Tambahkan fitur yang dipilih
    for FEATURE in "${SELECTED_FEATURES[@]}"; do
        handle_feature_choice "$FEATURE" "$MODULE_PATH"
    done

    print_success "Modul Magisk berhasil dibuat di: $MODULE_PATH"
}

