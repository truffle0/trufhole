# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual for useful filesystem tools"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE=""

RDEPEND="
  sys-fs/btrfs-progs
  sys-fs/dosfstools
  sys-fs/jfsutils
  sys-fs/ntfs3g
  sys-fs/reiserfsprogs
  sys-fs/xfsprogs
  sys-fs/e2fsprogs

  net-fs/sshfs
  net-fs/samba
  sys-fs/lvm2
  net-fs/nfs-utils

  sys-fs/mtd-utils

  sys-fs/f2fs-tools
  sys-fs/udftools
  sys-fs/exfatprogs
"
