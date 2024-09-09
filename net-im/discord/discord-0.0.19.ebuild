# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop

DESCRIPTION="All-in-one voice and text chat for gamers that's free, secure, and works on both your desktop and phone."
HOMEPAGE="https://discord.com"
RESTRICT="mirror"

if [[ ${PV} == 9999 ]] ; then
	SRC_URI="https://discord.com/api/download?platform=linux&format=tar.gz -> ${P}.tar.gz"
else
	SRC_URI="https://dl.discordapp.net/apps/linux/${PV}/discord-${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi


LICENSE="all-rights-reserved"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

S="${WORKDIR}/${PN}"
src_unpack() {
	default
	mv "${WORKDIR}/Discord" "${WORKDIR}/discord"
}

src_prepare() {
	default

	# Prepare the files to go in /opt/discord
	echo "Sorting install files..."
	mkdir "${S}/discord"
	mv "${S}"/* "${S}/discord"

	# Deal with desktop and icon files file
	echo -n "Desktop files: Moving... "
	mv "${S}/discord/discord.desktop" "${S}"
	cp "${S}/discord/discord.png" "${S}"
	echo "Modifying... "
	sed /Exec=/c'Exec=/usr/bin/discord' "${S}/discord.desktop" > "${S}/discord.desktop"
	echo "Done!"

	# Remove postinst.sh script and save for execution at the end of install
	echo "Moving postinst.sh..."
	rm -f "${S}/discord/postinst.sh"
	# Doesn't actually run, but the post install for this ebuild does a similar thing.
}

src_install() {
	into /
	dodir "/opt/discord"
	cp -R "${S}/discord"/* "${D}/opt/discord" || die "Install failed!"

	dosym "/opt/discord/Discord" "/usr/bin/discord"
	domenu "${S}/discord.desktop"
	doicon "${S}/discord/discord.png"
}

pkg_postinst() {
	if pgrep -i Discord ; then
		pkill -e discord
		sleep 1
		pkill -e -SIGKILL discord
	fi

	[ -S /tmp/discordstable.sock ] && rm -f /tmp/discordstable.sock

	ewarn "No user files were automatically modified (we did kill running instances of discord tho soz)"
	ewarn "But it is *highly* recommended to delete ~/.config/discordstable/{Cache, GPUCache}"
	ewarn "It's something about it sometimes fixing bugs. It's a good idea, just do it."
}
