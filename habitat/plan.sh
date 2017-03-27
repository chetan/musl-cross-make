pkg_name=gcc-musl
pkg_origin=core
pkg_version=6.3.0
pkg_license=('mit')
pkg_source=https://foo/bar
pkg_shasum=foobar
pkg_deps=()
pkg_build_deps=(
  core/gcc
  core/make
  core/patch
  core/coreutils
  core/diffutils
  core/sed
)
pkg_bin_dirs=(bin)
pkg_include_dirs=(include)
pkg_lib_dirs=(lib)

do_download() {
  return 0
}

do_unpack() {
  cp -a /src /hab/cache/src/$pkg_dirname/
  cp /src/habitat/config.mak /hab/cache/src/$pkg_dirname/
}

do_verify() {
  return 0
}

do_prepare() {
  ln -sf $(hab pkg path core/coreutils)/bin/pwd /bin/pwd
}

do_build() {
  make
}

# this step failed several times with:
# gcc-musl: Stripping unneeded symbols from binaries and libraries
# strip: unable to copy file '/hab/pkgs/chetan/gcc-musl/6.3.0/20170326194328/bin/x86_64-linux-musl-strip'; reason: Text file busy
# disabled for now. don't think strip works on these bins anyway
do_strip() {
  return 0
}

do_install() {
  local l f
  make OUTPUT=$pkg_prefix install
  for f in $pkg_prefix/bin/x86_64-linux-musl*; do
    l=$(echo $f | sed -e 's/x86_64-linux-musl-//')
    ln -s $f $l
  done
}
