# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Persepolis Download Manager is a GUI for aria2."
HOMEPAGE="https://github.com/persepolisdm/persepolis"

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/persepolisdm/persepolis.git"
else
	SRC_URI="https://github.com/persepolisdm/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

PYTHON_COMPAT=( python3_{11..13} )
inherit meson python-r1

LICENSE="GPL-3"
SLOT="0"

DEPEND="
	dev-python/pyqt5
	dev-python/requests
	dev-python/setuptools
	dev-python/lxml
	dev-python/pysocks
	dev-python/beautifulsoup4
	dev-python/pyopenssl
	dev-python/certifi
	dev-python/sip
	dev-python/urllib3
	net-misc/aria2
"
RDEPEND="${PYTHON_DEPS} ${DEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_configure() {
	python_setup
	meson_src_configure
}

src_install() {
	meson_src_install
	python_optimize
}
