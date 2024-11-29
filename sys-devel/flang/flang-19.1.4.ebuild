# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inhert cmake llvm.org llvm-utils

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

LLVM_COMPONENTS=(
    flang mlir cmake
)
LLVM_USE_TARGETS=llvm
llvm.org_set_globals

get_distribution_components() {
	local sep=${1-;}

	local out=(
		# common stuff
		clang-cmake-exports
		clang-headers
		clang-resource-headers
		libclang-headers

		aarch64-resource-headers
		arm-common-resource-headers
		arm-resource-headers
		core-resource-headers
		cuda-resource-headers
		hexagon-resource-headers
		hip-resource-headers
		hlsl-resource-headers
		mips-resource-headers
		opencl-resource-headers
		openmp-resource-headers
		ppc-htm-resource-headers
		ppc-resource-headers
		riscv-resource-headers
		systemz-resource-headers
		utility-resource-headers
		ve-resource-headers
		webassembly-resource-headers
		windows-resource-headers
		x86-resource-headers

		# libs
		clang-cpp
		libclang
	)

	printf "%s${sep}" "${out[@]}"
}

src_configure() {
    llvm_prepend_path "${LLVM_MAJOR}"

    local mycmakeargs=(
        -DDEFAULT_SYSROOT=$(usex prefix-guest "" "${PREFIX}")
        -DCMAKE_INSTALL_PREFIX="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}"
        -DCMAKE_INSTALL_MANDIR="${EPREFIX}/usr/lib/llvm/${LLVM_MAJOR}/share/man"
        -DLLVM_DISTRIBUTION_COMPONENTS=$(get_distribution_components)

        -DLLVM_TARGETS_TO_BUILD="${LLVM_TARGETS// /;}"
        
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