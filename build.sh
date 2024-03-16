TERMUX_PKG_HOMEPAGE=https://github.com/Koihik/LuaFormatter
TERMUX_PKG_DESCRIPTION="Code formatter for Lua"
TERMUX_PKG_LICENSE="Apache-2.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=1.3.6
TERMUX_PKG_SRCURL=https://github.com/Koihik/LuaFormatter/archive/$TERMUX_PKG_VERSION.tar.gz
TERMUX_PKG_SHA256=57dff41282f2e039f7f323511f2c9c238a174f2772fba567bb083bc3ed9230da
TERMUX_PKG_EXTRA_CONFIGURE_ARGS="-DBUILD_TESTS=0 -DCOVERAGE=0"
TERMUX_PKG_FORCE_CMAKE=true

termux_step_post_get_source()
{
    termux_download \
    https://github.com/catchorg/Catch2/archive/v2.13.7.tar.gz \
    $TERMUX_PKG_CACHEDIR/Catch2-2.13.7.tar.gz \
    3cdb4138a072e4c0290034fe22d9f0a80d3bcfb8d7a8a5c49ad75d3a5da24fae
    tar --strip-components=1 \
    -xf $TERMUX_PKG_CACHEDIR/Catch2-2.13.7.tar.gz \
    -C $TERMUX_PKG_SRCDIR/third_party/Catch2

    termux_download \
    https://github.com/antlr/antlr4/archive/4.7.2.tar.gz \
    $TERMUX_PKG_CACHEDIR/antlr4-4.7.2.tar.gz \
    46f5e1af5f4bd28ade55cb632f9a069656b31fc8c2408f9aa045f9b5f5caad64
    tar --strip-components=1 \
    -xf $TERMUX_PKG_CACHEDIR/antlr4-4.7.2.tar.gz \
    -C $TERMUX_PKG_SRCDIR/third_party/antlr4

    termux_download \
    https://github.com/Taywee/args/archive/6.4.6.tar.gz \
    $TERMUX_PKG_CACHEDIR/args-6.4.6.tar.gz \
    41ed136bf9b216bf5f18b1de2a8d22a870381657e8427d6621918520b6e2239c
    tar --strip-components=1 \
    -xf $TERMUX_PKG_CACHEDIR/args-6.4.6.tar.gz \
    -C $TERMUX_PKG_SRCDIR/third_party/args

    termux_download \
    https://github.com/jbeder/yaml-cpp/archive/yaml-cpp-0.6.3.tar.gz \
    $TERMUX_PKG_CACHEDIR/yaml-cpp-yaml-cpp-0.6.3.tar.gz \
    77ea1b90b3718aa0c324207cb29418f5bced2354c2e483a9523d98c3460af1ed
    tar --strip-components=1 \
    -xf $TERMUX_PKG_CACHEDIR/yaml-cpp-yaml-cpp-0.6.3.tar.gz \
    -C $TERMUX_PKG_SRCDIR/third_party/yaml-cpp
}
