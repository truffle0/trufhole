# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

WX_GTK_VER="3.2-gtk3"

inherit cmake wxwidgets virtualx

# libnyquist doesn't have tags, instead use the specific submodule commit tenacity does
LIBNYQUIST_COMMIT="d4fe08b079538a2fd79277ef1a83434663562f04"

DESCRIPTION="Easy-to-use, privacy-friendly, FLOSS, cross-platform multi-track audio editor"
HOMEPAGE="https://tenacityaudio.org/"
SRC_URI="https://codeberg.org/tenacityteam/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz
	https://codeberg.org/tenacityteam/libnyquist/archive/${LIBNYQUIST_COMMIT}.tar.gz -> ${PN}-libnyquist-${PV}.tar.gz"

# codeberg doesn't append tag
S="${WORKDIR}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE="alsa ffmpeg +midi +lame +id3tag +mp3 +mp2 +flac +ogg +vorbis +sbsms +soundtouch +ladspa +lv2 vamp +vst2"

DEPEND="
	dev-libs/glib:2
	x11-libs/gtk+:3
	x11-libs/wxGTK:${WX_GTK_VER}=[X]
	media-libs/alsa-lib
	dev-libs/expat
	flac? ( media-libs/flac )
	sys-devel/gettext
	media-sound/lame
	id3tag? ( media-libs/libid3tag )
	mp3? ( media-libs/libmad )
	ogg? ( media-libs/libogg )
	media-libs/libsndfile
	vorbis? ( media-libs/libvorbis )
	lv2? (
		media-libs/lilv
		media-libs/lv2
	)
	midi? (
		media-libs/portaudio
		media-libs/portmidi
	)
	dev-libs/serd
	dev-libs/sord
	soundtouch? ( media-libs/libsoundtouch )
	media-libs/soxr
	dev-db/sqlite
	media-libs/sratom
	media-libs/suil
	media-libs/taglib
	mp2? ( media-sound/twolame )
	media-libs/vamp-plugin-sdk
	x11-libs/wxGTK
	sys-libs/zlib
	ffmpeg? ( media-video/ffmpeg )
	sbsms? ( media-libs/libsbsms )
	vamp? ( media-libs/vamp-plugin-sdk )
"
RDEPEND="${DEPEND}"

src_unpack() {
	default

	# otherwise build will try to run git --submodule --init
	rmdir "${S}/lib-src/libnyquist" || die
	ln -s "${WORKDIR}/libnyquist" "${S}/lib-src/libnyquist"
}

src_prepare() {
	cmake_src_prepare
}

src_configure() {
	setup-wxwidgets

	local mycmakeargs=(
		-DVCPKG=OFF

		# this is handled separately
		-DSCCACHE=OFF
		-DCCACHE=OFF

		# Pre-Compiled Headers needs to stay off, even with ccache
		# otherwise it causes missing definitions
		-DPCH=OFF
		-DPERFORM_CODESIGN=OFF

		-DMIDI=$(usex midi ON OFF)
		-DID3TAG=$(usex id3tag ON OFF)
		-DMP3_DECODING=$(usex mp3 ON OFF)
		-DMP2=$(usex mp2 ON OFF)
		-DOGG=$(usex ogg ON OFF)
		-DVORBIS=$(usex vorbis ON OFF)
		-DFLAC=$(usex flac ON OFF)
		-DSBSMS=$(usex sbsms ON OFF)
		-DSOUNDTOUCH=$(usex soundtouch ON OFF)
		-DFFMPEG=$(usex ffmpeg ON OFF)
		-DLADSPA=$(usex ladspa ON OFF)
		#-DAUDIO_UNITS=OFF  # option only exists on MacOS
		-DLV2=$(usex lv2 ON OFF)
		-DVAMP=$(usex vamp ON OFF)
		-DVST2=$(usex vst2 ON OFF)

		# TODO: 'doc' use flag
		#-DMANUAL_PATH=$(usex doc PATH)
	)

	cmake_src_configure
}

src_test() {
	virtx cmake_src_test
}
