# Copyright 2016 Kenny Ballou
# Distributed under the terms of the GNU General Public License v3
# $Id$

EAPI=6
PYTHON_COMPAT=(python2_7)

inherit distutils-r1

MY_P=${PN}_${PV}

DESCRIPTION="Simple environment manager for the Go programming language"
HOMEPAGE="https://github.com/pwoolcoc/goenv"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="test"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
		 dev-python/docopt[${PYTHON_USEDEP}]
		 dev-python/clint[${PYTHON_USEDEP}]
		 test? ( dev-python/nose[${PYTHON_USEDEP}] )"
DEPEND="${RDEPEND}
		dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	pushd "${S}"
	mv tests goenv/.
	popd
	distutils-r1_python_prepare_all
}

python_test() {
	nosetests || die
}
