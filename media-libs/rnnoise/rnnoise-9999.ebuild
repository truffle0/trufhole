# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="Recurrent neural network for audio noise reduction"
HOMEPAGE="https://jmvalin.ca/demo/rnnoise/"
RESTRICT="mirror"

EGIT_REPO_URI="https://github.com/xiph/rnnoise.git"
EGIT_BRANCH="master"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"


DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_configure() {
	eautoreconf -isf
	default
}

src_postinst() {
	libtool --finish /usr/lib64
}