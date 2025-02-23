# Starting-magisk-module-project



## Stuktur project:
```bash
magisk-module-builder/
│── scripts/
│   ├── build.sh           # Skrip untuk membangun modul hingga siap diinstal
│   ├── input.sh           # Skrip untuk meminta input pengguna
│   ├── features.sh        # Skrip untuk menangani fitur yang dipilih
│   ├── utils.sh           # Skrip utilitas yang digunakan oleh skrip lainnya
│── templates/
│   ├── module.prop.tpl    # Template untuk module.prop
│   ├── service.sh.tpl     # Template untuk service.sh
│   ├── customize.sh.tpl   # Template untuk customize.sh
│── results/               # Folder hasil build modul
│── setup.sh               # Skrip utama untuk menjalankan setup
│── .gitignore             # Abaikan isi folder results
│── README.md              # Dokumentasi proyek
```

## Jalankan
```bash
chmod +x setup.sh
./setup.sh
```

## ikuti proses

