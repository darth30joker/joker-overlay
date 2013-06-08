# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils autotools

DESCRIPTION="Easy configuration generator interface for fontconfig"
HOMEPAGE="https://bitbucket.org/tagoh/libeasyfc"
SRC_URI="https://bitbucket.org/tagoh/libeasyfc/downloads/${PN}-${PV}.tar.bz2"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="x86 ~x86 amd64 ~amd64"
IUSE=""

DEPEND="media-libs/fontconfig"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}

src_configure() {
	econf
}

src_install() {
	default
}
