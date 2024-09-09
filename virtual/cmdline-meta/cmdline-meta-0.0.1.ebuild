# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual to pull dependencies for a fully functional and featured desktop environment based around sway"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE=""

RDEPEND="
  app-admin/sudo
  app-misc/screen

  media-gfx/imv
  media-video/mpv
  sci-visualization/gnuplot

  app-misc/nnn
  app-editors/vim

  app-misc/binwalk
  dev-vcs/git
  dev-util/strace
  sys-devel/gdb
  dev-util/valgrind
  sys-devel/patch

  app-text/tree
  sys-apps/which
  sys-apps/sed
  sys-apps/gawk

  app-arch/wimlib

  dev-util/uncrustify
  app-misc/neofetch

  sys-apps/i2c-tools
  sys-apps/flashrom
  www-client/links
  sys-power/powertop
  "
