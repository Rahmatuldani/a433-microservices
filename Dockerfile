# Menggunakan base image Node.js versi 14
FROM node:14

# Menentukan folder /app sebagai ruang kerja di dalam container
WORKDIR /app

# Menyalin seluruh kode sumber dari komputer lokal ke folder kerja container
COPY . .

# Mengatur variabel lingkungan untuk mode produksi dan alamat host database
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependensi hanya untuk production dan menjalankan proses build aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Menginformasikan bahwa aplikasi ini mendengarkan pada port 8080
EXPOSE 8080

# Menjalankan perintah utama untuk memulai aplikasi saat container dinyalakan
CMD ["npm", "start"]