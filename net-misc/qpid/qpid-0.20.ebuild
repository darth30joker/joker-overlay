# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils autotools

DESCRIPTION="QPID test"
HOMEPAGE="http://qpid.apache.org"
SRC_URI="http://apache.fayea.com/apache-mirror/${PN}/${PV}/${PN}-${PV}.tar.gz"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+cpp java"

DEPEND="dev-libs/cyrus-sasl"
RDEPEND="${DEPEND}"

pkg_pretend() {
	if ! use cpp ; then
		if ! use java; then
			die "cpp and java must have one"
		fi
	fi
}

src_prepare() {
	if use cpp ; then
		cd cpp
		# Create initial Makefile fragments that will force make to generate
		# the real ones.
		cat > src/rubygen.mk <<EOF
		\$(srcdir)/rubygen.mk: force
			\$(rgen_cmd)  \$(srcdir)/rubygen.mk
EOF
		cat > src/managementgen.mk <<EOF
		\$(srcdir)/managementgen.mk: force
			\$(mgen_cmd)
EOF
		cp ../QPID_VERSION.txt .
		eautoreconf
	fi
}

src_configure() {
	if use cpp ; then
		cd cpp
		econf
	fi
}

src_compile() {
	if use java; then
		ant -f build.xml build
	fi
}

src_install() {
	default
}
