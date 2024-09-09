# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="OBS Studio plugin that allows screen capture from wayland"
HOMEPAGE="https://hg.sr.ht/~scoopta/wlrobs"
SRC_URI="https://hg.sr.ht/~scoopta/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
RESTRICT="mirror"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-libs/wayland
	media-video/obs-studio
	"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	dev-util/meson
	dev-util/ninja
	"

OBS_PLUGIN_ROOT="/usr/lib64/obs-plugins"
S=${WORKDIR}/${PN}-v${PV}

pkg_unpack() {
	default
}

src_compile() {
	meson build
	ninja -C build
}

src_install() {
	dodir ${OBS_PLUGIN_ROOT}
	
	cp ${S}/build/libwlrobs.so ${D}${OBS_PLUGIN_ROOT}/ || die "Install failed!"
}
