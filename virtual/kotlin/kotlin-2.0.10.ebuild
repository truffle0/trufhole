# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual for Kotlin compiler"

KEYWORDS="~amd64"
SLOT="0/${PV}"

RDEPEND="|| (
	dev-lang/kotlin-bin:${SLOT}
	dev-lang/kotlin:${SLOT}
)"
