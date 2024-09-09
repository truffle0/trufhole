# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="User for OpenHAB"
ACCT_USER_ID=67
ACCT_USER_GROUPS=( ${PN} )
ACCT_USER_HOME="/opt/openhab"
ACCT_USER_HOME_PERMS=0755

acct-user_add_deps