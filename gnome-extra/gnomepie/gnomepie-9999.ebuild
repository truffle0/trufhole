# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 autotools

DESCRIPTION="Graphical desktop application launcher for Gnome"
HOMEPAGE="http://schneegans.github.io/gnome-pie"
RESTRICT="mirror"

EGIT_REPO_URI="https://github.com/Schneegans/Gnome-Pie.git"
EGIT_BRANCH="master"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"


DEPEND="
	>=x11-libs/gtk+-3.24.26
	x11-libs/cairo
	dev-libs/libappindicator
	dev-libs/libgee
	x11-libs/libwnck
	app-arch/libarchive
	gnome-base/gnome-menus"
RDEPEND="${DEPEND}"
BDEPEND="
	>=dev-lang/vala-0.24"

src_prepare() {
	default

	# Compilation error, caused by a public constructor in an abstract class.
	# There's a chance this error is dependent on the ebuild author's installed version of VALA,
	# but this generalisation removes that error and makes it possible to compile.
	sed\
	  s/"public Action(string name, string icon, bool is_quickaction)"/"Action(string name, string icon, bool is_quickaction)"/\
	  ${S}/src/actions/action.vala > ${S}/src/actions/action.vala.new
	mv ${S}/src/actions/action.vala.new ${S}/src/actions/action.vala
}

src_configure() {
	echo "Compiling locales..."
	${S}/resources/locale/compile-po.sh
}

src_compile() {
	mkdir ${S}/build

	# Run cmake with valac executables parsed from /usr/bin/, since gnome-pie struggles to find any that don't have the exact name "/usr/bin/valac"
	cmake -B ${S}/build ${S} -DVALA_EXECUTABLE=$(find /usr/bin/ -name "valac*" -printf "%p," | sed s/,$//) || die "CMake failed!"

	emake -C ${S}/build || die "Make failed!"
}

src_install() {
	emake install -C ${S}/build DESTDIR="${D}" PREFIX="/usr" || die "Install failed!"
}
