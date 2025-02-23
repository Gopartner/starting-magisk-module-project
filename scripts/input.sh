#!/bin/bash

source scripts/utils.sh

get_module_info() {
    read -p "Masukkan nama modul Magisk []: " MODULE_NAME
    read -p "Masukkan ID Modul []: " MODULE_ID
    read -p "Masukkan Nama Modul []: " MODULE_NAME_FULL
    read -p "Masukkan Nama Author []: " MODULE_AUTHOR
    read -p "Masukkan Deskripsi Modul []: " MODULE_DESC
    read -p "Masukkan Versi Modul []: " MODULE_VER
    read -p "Masukkan Version Code (integer) []: " MODULE_VER_CODE
    read -p "Apakah modul ini memerlukan reboot setelah instalasi? (y/n) [n]: " MODULE_REBOOT
}

