#!/usr/bin/env sh

if [ -f ".pidfile" ]; then
  kill $(cat .pidfile) && rm .pidfile
  echo "Aplikasi berhasil dihentikan."
else
  echo "File .pidfile tidak ditemukan."
fi