# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

inherit cmake llvm.org 

DESCRIPTION=""
HOMEPAGE="https://llvm.org/"

LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA BSD public-domain rc"
SLOT="${LLVM_MAJOR}/${LLVM_SOABI}"
KEYWORDS="~amd64"

DEPEND="
    ~sys-devel/llvm-${PV}:${LLVM_MAJOR}
"
RDEPEND="${DEPEND}"
BDEPEND=""

LLVM_COMPONENTS=( clang cmake )
LLVM_USE_TARGETS=llvm
llvm.org_set_globals

src_prepare() {
    llvm.org_src_prepare
}

src_configure() {
    llvm_prepend_path "${LLVM_MAJOR}"

    local mycmakeargs=(
        -DDEFAULT_SYSROOT=$(usex prefix-guest "" "${PREFIX}")
        -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}"
        -DCMAKE_INSTALL_MANDIR="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}/share/man"
        
        -DBUILD_SHARED_LIBS=OFF
        
        # libgomp support fails to find headers without explicit -I
		# furthermore, it provides only syntax checking
		-DCLANG_DEFAULT_OPENMP_RUNTIME=libomp

        -DPython3_EXECUTABLE="${PYTHON}"
    )

    cmake_src_configure
}

src_compile() {
    cmake_build distribution
}

