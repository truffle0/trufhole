# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
GST_ORG_MODULE=gst-plugins-good

inherit gstreamer-meson

DESCRIPION="V4L2 source/sink plugin for GStreamer"
#KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~sparc x86"
KEYWORDS="~amd64"
IUSE="udev"

RDEPEND="
	>=media-libs/libv4l-0.9.5[${MULTILIB_USEDEP}]
	>=media-libs/gst-plugins-base-${PV}:${SLOT}[${MULTILIB_USEDEP}]
	udev? ( >=dev-libs/libgudev-208:=[${MULTILIB_USEDEP}] )
"
DEPEND="${RDEPEND}
	virtual/os-headers
"

GST_PLUGINS_ENABLED="v4l2"

src_prepare() {
	if use elibc_musl ; then
		eapply "${FILESDIR}/ignore-ioctl-typing.patch"
		ewarn "ignore-ioctl-typing.patch is a temporary fix for the issue with typing differences"
		ewarn "between glibc and musl. It is not stable or portable, and shouldn't be used longterm."
		ewarn "While it should work fine in this case, it's not the correct way to resolve it"
	fi

	default
}

multilib_src_configure() {
	local emesonargs=(
		-Dv4l2-gudev=$(usex udev enabled disabled)
	)

	gstreamer_multilib_src_configure
}
