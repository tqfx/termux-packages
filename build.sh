TERMUX_PKG_HOMEPAGE=https://github.com/tqfx/liba
TERMUX_PKG_DESCRIPTION="An algorithm library based on C/C++ language"
TERMUX_PKG_LICENSE="MPL-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.1.7
TERMUX_PKG_SRCURL=https://github.com/tqfx/liba/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=2a6bc65298f4c49cd0d61cccd8d4b82e66e378f96fc2d99188fda70642150d88
TERMUX_PKG_FORCE_CMAKE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DLIBA_IPO=1
-DLIBA_PKGCONFIG=1
-DBUILD_TESTING=0"

termux_step_post_make_install()
{
    cmake -S $TERMUX_PKG_SRCDIR -B $TERMUX_PKG_BUILDDIR -DLIBA_LUA=1 \
    -DLUA_INCLUDE_DIR=$TERMUX_PREFIX/include/lua5.4 \
    -DLUA_LIBRARY=$TERMUX_PREFIX/lib/liblua5.4.so
    cmake --build $TERMUX_PKG_BUILDDIR
    cmake -E copy $TERMUX_PKG_BUILDDIR/lua/liba.so $TERMUX_PREFIX/lib/lua/5.4/liba.so

    cmake -S $TERMUX_PKG_SRCDIR -B $TERMUX_PKG_BUILDDIR \
    -DLUA_INCLUDE_DIR=$TERMUX_PREFIX/include/lua5.3 \
    -DLUA_LIBRARY=$TERMUX_PREFIX/lib/liblua5.3.so
    cmake --build $TERMUX_PKG_BUILDDIR
    cmake -E copy $TERMUX_PKG_BUILDDIR/lua/liba.so $TERMUX_PREFIX/lib/lua/5.3/liba.so

    cmake -S $TERMUX_PKG_SRCDIR -B $TERMUX_PKG_BUILDDIR \
    -DLUA_INCLUDE_DIR=$TERMUX_PREFIX/include/lua5.2 \
    -DLUA_LIBRARY=$TERMUX_PREFIX/lib/liblua5.2.so
    cmake --build $TERMUX_PKG_BUILDDIR
    cmake -E copy $TERMUX_PKG_BUILDDIR/lua/liba.so $TERMUX_PREFIX/lib/lua/5.2/liba.so

    cmake -S $TERMUX_PKG_SRCDIR -B $TERMUX_PKG_BUILDDIR \
    -DLUA_INCLUDE_DIR=$TERMUX_PREFIX/include/lua5.1 \
    -DLUA_LIBRARY=$TERMUX_PREFIX/lib/liblua5.1.so
    cmake --build $TERMUX_PKG_BUILDDIR
    cmake -E copy $TERMUX_PKG_BUILDDIR/lua/liba.so $TERMUX_PREFIX/lib/lua/5.1/liba.so
}
