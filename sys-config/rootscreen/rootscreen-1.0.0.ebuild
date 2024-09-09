# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Basic openrc custom init script and environment modifications which add extra functionality and management for screen sessions"
HOMEPAGE="https://trufhole/rootscreen"

SLOT="0"
KEYWORDS="amd64 ~amd64"

DEPEND="
  sys-apps/openrc"
RDEPEND="
  app-misc/screen
  app-shells/bash
  sys-apps/openrc"

src_unpack() {
  mkdir ${S}
  cp "${FILESDIR}/rootscreen-${PV}" "${S}/rootscreen"
  cp "${FILESDIR}/screen-${PV}.env" "${S}/screen.env"
}

src_configure() {
  chmod +x "${S}/rootscreen"
}

src_install() {
  dodir "/etc/init.d"
  dodir "/etc/bash/bashrc.d"
  cp "${S}/rooscreen" "${D}/etc/init.d/"
  cp "${S}/screen.env" "${D}/etc/bash/bashrc.d/"
}
