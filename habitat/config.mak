
TARGET = x86_64-linux-musl

# BINUTILS_VER = 2.25.1
# zlib error with this version:
# GCC_VER = 5.2.0

# couldn't compile with these:
# COMMON_CONFIG += CC="i486-linux-musl-gcc -static --static"
# CXX="i486-linux-musl-g++ -static --static"

# COMMON_CONFIG += "--with-debug-prefix-map=$(PWD)="
COMMON_CONFIG += --disable-nls

# GCC_CONFIG += --enable-languages=c,c++,fortran
GCC_CONFIG += --enable-languages=c,c++
GCC_CONFIG += --disable-libquadmath --disable-decimal-float
GCC_CONFIG += --disable-multilib
# GCC_CONFIG += --enable-threads=posix
# GCC_CONFIG += --enable-install-libiberty
# GCC_CONFIG += --disable-werror
# GCC_CONFIG += --with-gmp="$(pkg_path_for gmp)"
# # GCC_CONFIG += --with-mpfr="$(pkg_path_for mpfr)"
# GCC_CONFIG += --with-mpc="$(pkg_path_for libmpc)"
# GCC_CONFIG += --with-system-zlib
# GCC_CONFIG += --enable-lto
