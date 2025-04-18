# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
RUBY_BINDIR="bin"
inherit ruby-fakegem

DESCRIPTION="Lightweight local DNS & mDNS Cache"
HOMEPAGE=""https://github.com/truffle0/dns_cacher
SRC_URI="https://github.com/truffle0/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND+="
	>=dev-ruby/async-2.8
"

all_ruby_install() {
	all_fakegem_install

	newinitd "${FILESDIR}/${PN}-0.1.0.initd" dns_cacher
}
