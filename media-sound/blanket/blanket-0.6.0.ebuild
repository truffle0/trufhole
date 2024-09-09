# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson git-r3 gnome2-utils xdg

DESCRIPTION="Improve focus and increase your productivity by listening to different sounds. Or allows you to fall asleep in a noisy environment."
HOMEPAGE="https://github.com/rafaelmardojai/blanket"
EGIT_REPO_URI="https://github.com/rafaelmardojai/blanket.git"

if [ ${PV} == "9999" ] ; then
  KEYWORDS="-*"
else
  EGIT_COMMIT="${PV}"
  KEYWORDS="amd64"
fi

LICENSE=""
SLOT="0"

DEPEND="
  >=dev-lang/python-3.0.0
  >=dev-python/pygobject-3.0.0
  >=gui-libs/gtk-4.0.0
  >=gui-libs/libadwaita-1.1.0
  media-libs/gstreamer"
RDEPEND="${DEPEND}"
BDEPEND="
  dev-util/meson
  dev-util/ninja"

src_configure() {
  meson_src_configure
}

pkg_postinst() {
  xdg_pkg_postinst
  gnome2_schemas_update
}

pkg_postrm() {
  xdg_pkg_postrm
  gnome2_schemas_update
}
