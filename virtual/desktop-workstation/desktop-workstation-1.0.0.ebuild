# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Set of WM independent desktop workstation tools"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE="web office cad sound files gaming"

RDEPEND="
  office? (
    app-office/libreoffice
    kicad
    media-gfx/gthumb
    app-text/evince
    sci-calculators/qalculate-gtk
  )
  files? (
    xfce-base/thunar
    xfce-base/thunar-volman
    net-ftp/filezilla
  )
  web? (
    www-client/firefox
    net-irc/hexchat
    net-im/discord
    media-sound/spotify
    app-crypt/gpa
  )
  creating? (
    media-gfx/krita
    kde-apps/kdenlive
    app-editor/atom
    media-gfx/blender
    sci-electronics/kicad
  )
  sound? (
    media-sound/pavucontrol
    media-sound/easyeffects
  )
