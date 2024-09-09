# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Set of WM independent desktop workstation tools"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE="+office +kicad +sound +files +social -gaming +science +net +fonts +creating -rgb -virtual-machine"

RDEPEND="
  x11-misc/qt5ct
  x11-misc/pcmanfm
  www-client/firefox
  app-editors/mousepad
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
    app-misc/gnote
    mail-client/thunderbird
  )
  files? (
    app-arch/xarchiver
    net-ftp/filezilla
    net-p2p/transmission
    net-misc/yt-dlp
  )
  social? (
    net-irc/hexchat
    net-im/discord
    net-im/zoom
    net-im/skypeforlinux
    media-sound/spotify
    app-crypt/gpa
    www-client/google-chrome
    media-video/obs-studio
    games-util/steam-launcher
    app-misc/piper
  )
  gaming? (
    games-util/lutris
    dev-java/openjdk:11
    dev-java/openjdk:17
  )
  creating? (
    media-gfx/krita
    kde-apps/kdenlive
    media-gfx/blender
    app-editors/vscode
  )
  kicad? (
    sci-electronics/kicad
    sci-electronics/kicad-footprints
    sci-electronics/kicad-packages3d
    sci-electronics/kicad-templates
    sci-electronics/kicad-symbols
    sci-electronics/kicad-templates
  )
  science? (
    sci-visualization/gnuplot
    sci-visualization/labplot
    sci-calculators/qalculate-gtk
    media-gfx/cura
  )
  net? (
    net-analyzer/wireshark
    net-analyzer/gnome-nettool
    gnome-extra/nm-applet
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
  )
  rgb? (
    app-misc/openrgb
    app-misc/openrgb-plugin-effects
    app-misc/openrgb-plugin-skin
    app-misc/openrgb-plugin-visualmap
  )
  virtual-machine? (
    app-emulation/virt-manager
  )
"