# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Set of WM independent desktop workstation tools"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE="+social +office +kicad +sound +files +science +fonts +creating"

RDEPEND="
  x11-misc/qt5ct
  x11-misc/pcmanfm
  www-client/firefox
  gnome-extra/nm-applet
  office? (
    app-office/libreoffice
    media-gfx/gthumb
    sci-calculators/qalculate-gtk
    net-print/hplip
    net-print/cups
    media-video/vlc
    media-gfx/xsane
    media-gfx/sane-airscan
    media-gfx/gthumb
    gnome-extra/gnome-characters
    app-text/evince
    app-text/pdfarranger
    app-text/foliate
    app-editors/mousepad
    app-misc/gnote
  )
  files? (
    app-arch/xarchiver
    net-ftp/filezilla
    net-p2p/transmission
    net-misc/youtube-dl
  )
  social? (
    net-irc/hexchat
    net-im/discord
    net-im/zoom
    media-sound/spotify
    app-crypt/gpa
    www-client/google-chrome
    media-video/obs-studio
    games-util/steam-launcher
    app-misc/piper
  )
  creating? (
    media-gfx/krita
    kde-apps/kdenlive
    app-editor/atom
    media-gfx/blender
  )
  kicad? (
    sci-electronics/kicad
    sci-electronics/kicad-footprints
    sci-electronics/kicad-packages
    sci-electronics/kicad-templates
    sci-electronics/kicad-symbols
    sci-electronics/kicad-templates
  )
  science? (
    sci-visualization/gnuplot
    sci-visualization/labplot
    sci-calculators/qalculate-gtk
    net-analyzer/wireshark
    net-analyzer/gnome-nettoolS
    kde-plasma/ksysguard
  )
  sound? (
    media-sound/pavucontrol
    media-sound/easyeffects
    media-video/vlc
    media-sound/gnome-sound-recorder
    media-libs/rnnoise
    media-libs/rubberband
    media-sound/blanket
  )
  fonts? (
    media-fonts/cantarell
    media-fonts/corefonts
    media-fonts/croscorefonts
    media-fonts/crosextrafonts-carlito
    media-fonts/droid
    media-fonts/fontawesome
    media-fonts/hack
    media-fonts/noto-emoji
    media-fonts/noto
    media-fonts/quivira
    media-fonts/stix-fonts
    media-fonts/ubuntu-font-family
    media-fonts/stix-fonts
  )"
