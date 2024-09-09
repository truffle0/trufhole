# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo git-r3

DESCRIPTION="Elkowars Wacky Widgets is a standalone widget system made in Rust"
HOMEPAGE="https://github.com/elkowar/eww"
EGIT_REPO_URI="https://github.com/elkowar/eww.git"
EGIT_COMMIT="65d622c81f2e753f462d23121fa1939b0a84a3e0"
RESTRICT="mirror"

LICENSE="
	Apache-2.0
	|| ( Apache-2.0 MIT )
	|| ( Apache-2.0 BSL-1.1 )
	|| ( Artistic-2 CC0-1.0 )
	BSD
	CC0-1.0
	ISC
	MIT
	|| ( MIT Unlicense )
"
SLOT="0"
KEYWORDS="~amd64"
IUSE="wayland"

DEPEND="
	x11-libs/gtk+:3
	x11-libs/pango
	x11-libs/gdk-pixbuf
	x11-libs/cairo
	>=dev-libs/glib-2.0
	sys-devel/gcc
	wayland? (
	gui-libs/gtk-layer-shell
	)
"
BDEPEND="
	$DEPEND
	dev-lang/rust[nightly]
"
RDEPEND="
	$DEPEND
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_compile() {
	use wayland && features="--no-default-features --features=wayland"
	! use wayland && features="--no-default-features --features X11"
	
	cargo_src_compile ${features}
}

src_install() {
	dodoc README.md CHANGELOG.md
	cd target/release || die
	dobin eww
	elog "Eww wont run without a config file (usually in ~/.config/eww)."
	elog "For example configs visit https://github.com/elkowar/eww#examples"
}
