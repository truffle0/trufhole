# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual to pull dependencies for a fully functional and featured desktop environment based around sway"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE=""

RDEPEND="
  gui-wm/sway
  gui-apps/swaylock
  gui-apps/swayidle

  gui-libs/greetd
  gui-apps/tuigreet
  sys-apps/dbus
  sys-auth/seatd

  x11-misc/dunst
  media-sound/playerctl
  gui-apps/waybar

  lxqt-base/lxqt-policykit
  media-video/pipewire[pipewire-alsa,jack-sdk,sound-server]
  media-sound/pavucontrol

  gui-apps/wob
  gui-apps/wofi

  gui-apps/swappy
  gui-apps/slurp
  gui-apps/grim

  sys-apps/xdg-desktop-portal-gtk
  sys-apps/xdg-desktop-portal
  gui-libs/xdg-desktop-portal-wlr

  gui-apps/wf-recorder
  gui-apps/wl-clipboard
  gui-libs/wlrobs

  x11-terms/alacritty
  x11-misc/pcmanfm"
