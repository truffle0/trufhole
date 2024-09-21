# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1

# Version bump from gentoo sources, versions of the kernel >= 6.11.0 will not work
# with versions below this due to an api change in the kernel 'platform_driver' struct required by platform drivers
# specifically it requires certain functions return void instead of int* (from previous kernel versions)
# this commit introduces a preprocessor check that will switch the function declaration based on the kernel version.
# Required for latest kernel builds, but still works for older versions
# - truffle

COMMIT_HASH="6164bc3dec24b6bb2806eedd269df6a170bcc930"
DESCRIPTION="Kernel module to expose more Framework Laptop stuff"
HOMEPAGE="https://github.com/DHowett/framework-laptop-kmod"
SRC_URI="https://github.com/DHowett/framework-laptop-kmod/archive/${COMMIT_HASH}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT_HASH}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

CONFIG_CHECK="
	~CROS_EC
	~CROS_EC_LPC
"

DOCS=(
	README.md
)

pkg_setup() {
	linux-mod-r1_pkg_setup

	MODULES_MAKEARGS+=(
		KDIR="${KERNEL_DIR}"
	)
}

pkg_pretend() {
	check_extra_config
}

src_compile() {
	local modlist=(
		framework_laptop
	)
	linux-mod-r1_src_compile
}

pkg_postinst() {
	linux-mod-r1_pkg_postinst

	#if kernel_is -lt 6 7 0; then
		ewarn "For the Framework Laptop 13 AMD Ryzen 7040 series and the Framework Laptop 16a,"
		ewarn "you will need to apply the patch series from this URL:"
		ewarn "https://lore.kernel.org/chrome-platform/20231005160701.19987-1-dustin@howett.net/"
	#fi
}
