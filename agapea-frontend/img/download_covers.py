#!/usr/bin/env python3
"""
Descarga portadas de libros usando la API de Open Library.

Uso:
    python scripts/download_covers.py

Guarda las imágenes en: agapea-frontend/img/covers/

Requiere conexión a Internet. El script usa solo la librería estándar.
"""
from __future__ import annotations
import json
import os
import re
import sys
from urllib import parse, request, error

# Ajustar rutas relativas al propio script, así funciona si el .py está en la carpeta `img`
HERE = os.path.dirname(os.path.abspath(__file__))
LIBROS_JSON = os.path.join(HERE, 'libros.json')
OUT_DIR = os.path.join(HERE, 'covers')


def slugify(text: str) -> str:
    text = text.lower()
    text = re.sub(r"[^a-z0-9]+", '-', text)
    text = re.sub(r"^-+|-+$", '', text)
    return text or 'book'


def safe_filename(book: dict, ext: str = '.jpg') -> str:
    base = f"{book.get('id', '0')}_{slugify(book.get('titulo','').split(':')[0])}"
    return base + ext


def fetch_json(url: str) -> dict:
    req = request.Request(url, headers={'User-Agent': 'agapea-cover-downloader/1.0'})
    with request.urlopen(req, timeout=20) as resp:
        return json.load(resp)


def download(url: str, dest: str) -> bool:
    try:
        req = request.Request(url, headers={'User-Agent': 'agapea-cover-downloader/1.0'})
        with request.urlopen(req, timeout=30) as resp, open(dest, 'wb') as out:
            out.write(resp.read())
        return True
    except Exception as e:
        print(f"  ERROR descargando {url}: {e}")
        return False


def find_cover_for(book: dict) -> str | None:
    title = book.get('titulo', '')
    author = book.get('autor', '')

    q = f"https://openlibrary.org/search.json?title={parse.quote(title)}&author={parse.quote(author)}&limit=1"
    try:
        data = fetch_json(q)
    except Exception as e:
        print(f"  ERROR buscando en Open Library: {e}")
        return None

    docs = data.get('docs') or []
    if not docs:
        return None

    doc = docs[0]
    # prefer cover id
    cover_id = doc.get('cover_i')
    if cover_id:
        return f"https://covers.openlibrary.org/b/id/{cover_id}-L.jpg"

    # else try isbn
    isbns = doc.get('isbn') or []
    if isbns:
        return f"https://covers.openlibrary.org/b/isbn/{isbns[0]}-L.jpg"

    return None


def main() -> int:
    if not os.path.exists(LIBROS_JSON):
        print(f"No se encuentra {LIBROS_JSON}")
        return 2

    os.makedirs(OUT_DIR, exist_ok=True)

    with open(LIBROS_JSON, 'r', encoding='utf-8') as f:
        libros = json.load(f)

    print(f"Encontrados {len(libros)} libros en {LIBROS_JSON}")

    for book in libros:
        print(f"[{book.get('id')}] {book.get('titulo')} — {book.get('autor')}")
        dest_name = safe_filename(book)
        dest_path = os.path.join(OUT_DIR, dest_name)
        if os.path.exists(dest_path):
            print(f"  Ya existe: {dest_name}, saltando")
            continue

        cover_url = find_cover_for(book)
        if not cover_url:
            print("  No se encontró portada en Open Library")
            continue

        print(f"  Descargando {cover_url} -> {dest_name}")
        ok = download(cover_url, dest_path)
        if ok:
            print("  ✅ Descargado")
        else:
            print("  ❌ Falló descarga")

    print("Hecho. Imágenes guardadas en:", OUT_DIR)
    return 0


if __name__ == '__main__':
    sys.exit(main())
