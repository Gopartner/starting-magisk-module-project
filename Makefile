# Makefile untuk menjalankan setup.sh dan tugas lainnya

# Variabel
MODULE_NAME = MyMagiskModule
ZIP_NAME = $(MODULE_NAME).zip
SETUP_SCRIPT = setup.sh

# Target default (jalankan saat Anda mengetik 'make' saja)
all: run_setup

# Target untuk menjalankan setup.sh
run_setup:
	@echo "Menjalankan setup.sh..."
	@chmod +x $(SETUP_SCRIPT)  # Pastikan script dapat dijalankan
	@./$(SETUP_SCRIPT)
	@echo "Setup selesai."

# Target untuk membersihkan file yang tidak diperlukan
clean:
	@echo "Membersihkan file sementara..."
	@rm -f *.zip
	@rm -rf $(MODULE_NAME)
	@echo "Pembersihan selesai."

# Target untuk mengkompres module ke dalam file ZIP
package:
	@echo "Mengkompres module ke dalam file ZIP..."
	@zip -r $(ZIP_NAME) $(MODULE_NAME)
	@echo "Module berhasil dikompres: $(ZIP_NAME)"

# Target untuk menjalankan semua langkah (setup, package)
build: run_setup package

# Target untuk menampilkan bantuan
help:
	@echo "Gunakan perintah berikut:"
	@echo "  make run_setup   - Jalankan setup.sh"
	@echo "  make clean       - Bersihkan file sementara"
	@echo "  make package     - Kompres module ke dalam file ZIP"
	@echo "  make build       - Jalankan setup dan kompres module"
	@echo "  make help        - Tampilkan bantuan ini"

.PHONY: all run_setup clean package build help
