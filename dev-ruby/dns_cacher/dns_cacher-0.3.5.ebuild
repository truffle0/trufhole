# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

USE_RUBY="ruby31 ruby32 ruby33 ruby34"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
RUBY_BINDIR="bin"
inherit ruby-fakegem

DESCRIPTION="Lightweight local DNS & mDNS Cache"
HOMEPAGE=""https://git.b0tt0m.xyz/truffle/dns_cacher
SRC_URI="https://git.b0tt0m.xyz/truffle/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND+="
	>=dev-ruby/async-2.8
	virtual/resolvconf
"

all_ruby_unpack() {
	debug-print-function ${FUNCNAME} "$@"
	unpack ${A}

	# ensure package has version name on the end
	mv ${PN} ${P}
}

all_ruby_install() {
	all_fakegem_install

	newinitd "${S}/misc/dns_cacher.initd" dns_cacher

	insinto "/usr/lib/resolvconf"
	newins "${S}/misc/dns_cacher.resolvconf" "dns_cacher"
}
