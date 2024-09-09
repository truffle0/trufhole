# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="A python module that allows control of Raspberry Pi GPIOs"
HOMEPAGE="https://sourceforge.net/projects/raspberry-gpio-python/"
SRC_URI="https://pypi.io/packages/source/${P:0:1}/${PN}/${P/-/.}.tar.gz -> ${P}.tar.gz"
DOCS="README.txt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="arm arm64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND="
  dev-python/setuptools[${PYTHON_USEDEP}]"

# Update the package name so that it reads RPi.GPIO instead of RPi-GPIO, which is required in ebuild naming.
# This avoids naming problems, and it's easier than renaming the package in the unpack stage.
S=${WORKDIR}/${P/-/.}
