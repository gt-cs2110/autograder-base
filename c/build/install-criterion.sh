#!/usr/bin/env bash
set -euo pipefail

# This installs libcriterion on x86_64-linux-gnu using the prebuilt binary.
# If Criterion updates in the future, update these two environment variables:
INSTALL_URL=https://github.com/Snaipe/Criterion/releases/download/v2.4.2/criterion-2.4.2-linux-x86_64.tar.xz
ARCHIVE_DIR=criterion-2.4.2

mkdir -p build
cd build

wget -O criterion.tar.xz $INSTALL_URL
tar -xf criterion.tar.xz

mkdir -p /usr/local/include/
mkdir -p /usr/local/lib/x86_64-linux-gnu/
cp -a $ARCHIVE_DIR/include/. /usr/local/include/
cp -a $ARCHIVE_DIR/lib/. /usr/local/lib/x86_64-linux-gnu/

ldconfig