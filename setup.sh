#!/bin/bash

source scripts/utils.sh
source scripts/input.sh
source scripts/features.sh
source scripts/build.sh

print_info "=== Magisk Module Builder ==="
get_module_info

print_info "Pilih metode UI yang akan digunakan:"
echo "1. Overlay UI (Menggunakan Overlay Framework)"
echo "2. Aplikasi Pendamping"
read -p "Masukkan pilihan (1/2): " UI_CHOICE

choose_features
build_module

print_success "Proses selesai! Modul Anda tersedia di: results/$MODULE_NAME"

