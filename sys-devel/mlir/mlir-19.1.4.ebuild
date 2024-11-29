# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

inherit cmake llvm.org llvm-utils
inherit prefix

DESCRIPTION=""
HOMEPAGE="https://llvm.org/"

LICENSE="Apache-2.0-with-LLVM-exceptions UoI-NCSA BSD public-domain rc"
SLOT="${LLVM_MAJOR}/${LLVM_SOABI}"
KEYWORDS="~amd64"
IUSE="debug test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
    ~sys-devel/llvm-${PV}
"
RDEPEND="${DEPEND}"
BDEPEND=""

LLVM_COMPONENTS=(
    mlir llvm cmake
)
LLVM_USE_TARGETS=llvm
llvm.org_set_globals

src_configure() {
    llvm_prepend_path "${LLVM_MAJOR}"

    local mycmakeargs=(
        -DDEFAULT_SYSROOT=$(usex prefix-guest "" "${PREFIX}")
        -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}"
        -DCMAKE_INSTALL_MANDIR="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}/share/man"

        -DLLVM_TARGETS_TO_BUILD="${LLVM_TARGETS// /;}"
        
        -DBUILD_SHARED_LIBS=OFF
        
        # libgomp support fails to find headers without explicit -I
		# furthermore, it provides only syntax checking
		-DCLANG_DEFAULT_OPENMP_RUNTIME=libomp

        -DPython3_EXECUTABLE="${PYTHON}"
    )

    cmake_src_configure
}

