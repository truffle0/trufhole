# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual to pull dependencies for console programs that I like :3"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE="+portage +storage +boot +net +power +daemon"

RDEPEND="
    app-misc/screen
    app-editors/vim
    !app-editors/nano
    
    app-text/tree
    
    sys-apps/usbutils
    sys-apps/pciutils
    sys-apps/moreutils
    sys-apps/i2c-tools
    
    sys-apps/busybox
    app-admin/sudo

    www-client/links

    portage? (
        app-misc/neofetch
        app-eselect/eselect-repository
        app-portage/cpuid2cpuflags
        app-portage/eix
        app-portage/genlop
        app-portage/gentoolkit
        dev-util/pkgcheck
        dev-util/pkgdev
    )
    storage? (
        virtual/fstools
        net-ftp/vsftpd
        sys-apps/hdparm
        dev-vcs/git
        net-ftp/tftp-hpa
        net-ftp/vsftpd
        sys-apps/smartmontools
    )
    boot? (
        sys-kernel/dracut
        sys-apps/kexec-tools
        sys-apps/flashrom
        sys-boot/plymouth
        sys-boot/plymouth-openrc-plugin
    )
    net? (
        net-analyzer/maccchanger
        net-analyzer/nmap
        net-analyzer/traceroute
        net-firewall/nftables
        net-misc/iperf:3
        net-misc/socat
        net-misc/ntp
        net-analyzer/scapy
        net-analyzer/tcpdump
        net-misc/wol
        net-misc/dhcpcd
        net-misc/whois
        net-dns/bind-tools
    )
    power? (
        sys-power/powertop
        sys-power/intel-undervolt
        sys-apps/lm-sensors
        sys-apps/ipmi-utils
        sys-power/iasl
        sys-power/cpupower
    )
    daemon? (
        sys-process/cronie
        sys-process/at
        sys-power/thermald
    )
"