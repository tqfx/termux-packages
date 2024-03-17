TERMUX_PKG_HOMEPAGE=https://www.lua.org/
TERMUX_PKG_DESCRIPTION="Simple, extensible, embeddable programming language"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=5.2.4
TERMUX_PKG_DEPENDS="liblua52"
TERMUX_PKG_SRCURL=git+https://github.com/tqfx/lua.git
TERMUX_PKG_GIT_BRANCH=main
TERMUX_PKG_FORCE_CMAKE=true
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DLUA_IPO=1
-DLUA_VERSION=$TERMUX_PKG_VERSION
-DBUILD_TESTING=0"

termux_step_make_install()
{
    cmake -E copy $TERMUX_PKG_BUILDDIR/lua-$TERMUX_PKG_VERSION/$TERMUX_PKG_NAME $TERMUX_PREFIX/bin
}

termux_step_install_license()
{
    return
}
