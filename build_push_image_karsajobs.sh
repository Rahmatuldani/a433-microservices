#!/bin/bash

# Variabel untuk memudahkan penggantian username GitHub
# Ganti 'username_anda' dengan username GitHub Anda yang sebenarnya
USER_GITHUB="rahmatuldani"

# Membuat Docker image dari Dockerfile dengan nama item-app dan tag v1
docker build -t karsajobs:latest .

# Mengubah nama image agar sesuai dengan format GitHub Container Registry (ghcr.io)
docker tag karsajobs:latest ghcr.io/$USER_GITHUB/karsajobs:latest

# Melakukan login ke GitHub Packages via Terminal
# Gunakan Personal Access Token (PAT) sebagai pengganti password
echo "Silakan masukkan Personal Access Token GitHub Anda saat diminta password:"
docker login ghcr.io -u $USER_GITHUB

# Mengunggah (push) image ke GitHub Packages
docker push ghcr.io/$USER_GITHUB/karsajobs:latest