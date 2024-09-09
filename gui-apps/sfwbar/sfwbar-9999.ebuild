# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION=""
HOMEPAGE=""

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/LBCrion/${PN}.git"
else
	SRC_URI=""
	die "No version-based ebuilds"
fi

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-libs/json-c
	>=x11-libs/gtk+-3.24.30
	gui-libs/gtk-layer-shell"
RDEPEND="${DEPEND}"
BDEPEND=""
