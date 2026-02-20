#!/bin/bash

# Variabel untuk memudahkan penggantian username GitHub
# Ganti 'username_anda' dengan username GitHub Anda yang sebenarnya
USER_GITHUB="rahmatuldani"

# 1. Membuat Docker image dari Dockerfile dengan nama item-app dan tag v1
docker build -t item-app:v1 .

# 2. Melihat daftar image yang ada di penyimpanan lokal
docker images

# 3. Mengubah nama image agar sesuai dengan format GitHub Container Registry (ghcr.io)
docker tag item-app:v1 ghcr.io/$USER_GITHUB/item-app:v1

# 4. Melakukan login ke GitHub Packages via Terminal
# Gunakan Personal Access Token (PAT) sebagai pengganti password
echo "Silakan masukkan Personal Access Token GitHub Anda saat diminta password:"
docker login ghcr.io -u $USER_GITHUB

# 5. Mengunggah (push) image ke GitHub Packages
docker push ghcr.io/$USER_GITHUB/item-app:v1