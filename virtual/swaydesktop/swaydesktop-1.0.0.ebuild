# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual to pull dependencies for a fully functional and featured desktop environment based around sway"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE=""

RDEPEND="
  gui-wm/sway

  gui-libs/greetd
  gui-apps/tuigreet

  x11-misc/dunst
  media-sound/playerctl

  gui-apps/waybar
  gui-apps/sfwbar
  gui-apps/fuzzel
  x11-misc/dmenu

  lxde-base/lxappearance
  lxqt-base/lxqt-policykit

  gui-apps/swappy
  gui-apps/slurp
  gui-apps/grim

  gui-apps/wob
  gui-apps/wofi
  gui-apps/gammastep"
