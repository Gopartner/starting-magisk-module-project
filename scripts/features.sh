#!/bin/bash

source scripts/utils.sh

FEATURES=(
    "Bypass Play Integrity API"
    "App Manager (hapus aplikasi sistem/user)"
    "Device Spoofing (Ganti Identitas Perangkat)"
    "AdBlock System-wide"
    "DNS Changer"
    "Root Cloak"
    "Battery Optimization Tweaks"
    "Custom Kernel Settings"
    "Debugging Tools"
    "Overlay UI"
    "Aplikasi Pendamping"
)

SELECTED_FEATURES=()

choose_features() {
    print_info "Pilih fitur yang akan diterapkan ke modul:"
    for i in "${!FEATURES[@]}"; do
        echo "$((i+1)). ${FEATURES[$i]}"
    done
    echo "$((i+2)). Selesai"

    while true; do
        read -p "Masukkan nomor fitur (atau tekan $((i+2)) untuk selesai): " CHOICE
        if [[ "$CHOICE" -eq $((i+2)) ]]; then
            break
        elif (( CHOICE >= 1 && CHOICE <= ${#FEATURES[@]} )); then
            print_success "Menambahkan ${FEATURES[$((CHOICE-1))]}..."
            SELECTED_FEATURES+=("${FEATURES[$((CHOICE-1))]}")
        else
            print_error "Pilihan tidak valid!"
        fi
    done
}

handle_feature_choice() {
    local FEATURE="$1"
    local MODULE_PATH="$2"

    print_info "Menambahkan $FEATURE..."
    case "$FEATURE" in
        "Bypass Play Integrity API")
            touch "$MODULE_PATH/system/bin/bypass_play_integrity.sh"
            ;;
        "App Manager (hapus aplikasi sistem/user)")
            touch "$MODULE_PATH/system/bin/app_manager.sh"
            ;;
        "Device Spoofing (Ganti Identitas Perangkat)")
            touch "$MODULE_PATH/system/bin/device_spoofing.sh"
            ;;
        "AdBlock System-wide")
            touch "$MODULE_PATH/system/etc/hosts"
            ;;
        "DNS Changer")
            touch "$MODULE_PATH/system/bin/dns_changer.sh"
            ;;
        "Root Cloak")
            touch "$MODULE_PATH/system/bin/root_cloak.sh"
            ;;
        "Battery Optimization Tweaks")
            touch "$MODULE_PATH/system/etc/battery_tweaks.sh"
            ;;
        "Custom Kernel Settings")
            touch "$MODULE_PATH/system/etc/kernel_settings.sh"
            ;;
        "Debugging Tools")
            touch "$MODULE_PATH/system/bin/debug_tools.sh"
            ;;
        "Overlay UI")
            mkdir -p "$MODULE_PATH/ui/overlay"
            touch "$MODULE_PATH/ui/install.sh"
            ;;
        "Aplikasi Pendamping")
            mkdir -p "$MODULE_PATH/app/src"
            touch "$MODULE_PATH/app/AndroidManifest.xml"
            ;;
        *)
            print_error "Fitur tidak dikenali: $FEATURE"
            ;;
    esac
}

