#!/bin/bash

# Neutrino Projective Identity note compilation script

set -e

TEX_FILE="tex/NeutrinoProjectiveIdentity.tex"
OUTPUT_DIR="out"
MAIN_NAME="NeutrinoProjectiveIdentity"

mkdir -p "$OUTPUT_DIR"

export TEXINPUTS=".:./tex:${TEXINPUTS}"

pdflatex -file-line-error -interaction=nonstopmode -synctex=1 \
    -output-directory="$OUTPUT_DIR" "$TEX_FILE"

cd "$OUTPUT_DIR"
BSTINPUTS="../tex:${BSTINPUTS}" BIBINPUTS="../tex:${BIBINPUTS}" bibtex "$MAIN_NAME"
cd ..

pdflatex -file-line-error -interaction=nonstopmode -synctex=1 \
    -output-directory="$OUTPUT_DIR" "$TEX_FILE"
pdflatex -file-line-error -interaction=nonstopmode -synctex=1 \
    -output-directory="$OUTPUT_DIR" "$TEX_FILE"

ls -lh "$OUTPUT_DIR/$MAIN_NAME.pdf"
