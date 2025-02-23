#!/bin/bash

RESULTS_DIR="results"

# Pastikan direktori results ada
if [[ ! -d "$RESULTS_DIR" ]]; then
    echo "[ERROR] Direktori $RESULTS_DIR tidak ditemukan!"
    exit 1
fi

echo "[INFO] Daftar folder yang tersedia di $RESULTS_DIR:"
select folder in "$RESULTS_DIR"/*/; do
    if [[ -n "$folder" ]]; then
        folder=${folder%/}  # Hapus slash di akhir
        folder_name=$(basename "$folder")  # Ambil nama folder saja
        zip_name="$RESULTS_DIR/${folder_name}.zip"

        echo "[INFO] Mengompresi folder $folder_name menjadi $zip_name..."
        zip -r "$zip_name" "$folder"

        echo "[SUCCESS] File ZIP berhasil dibuat: $zip_name"

        # Pilihan install atau keluar
        echo "[INFO] Pilih tindakan selanjutnya:"
        echo "1. Install modul di Magisk"
        echo "2. Keluar"
        read -p "Masukkan pilihan (1/2): " choice

        case $choice in
            1)
                echo "[INFO] Menginstal $zip_name ke Magisk..."
                magisk --install-module "$zip_name" && echo "[SUCCESS] Modul berhasil diinstal!" || echo "[ERROR] Instalasi gagal."
                ;;
            2)
                echo "[INFO] Keluar..."
                exit 0
                ;;
            *)
                echo "[ERROR] Pilihan tidak valid. Keluar..."
                exit 1
                ;;
        esac
        break
    else
        echo "[ERROR] Pilihan tidak valid!"
    fi
done

