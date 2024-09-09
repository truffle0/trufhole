
# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Virtual to pull dependencies for console programs that I like :3"

SLOT="0"
KEYWORDS="amd64 ~amd64 ~arm"
IUSE="+zsh +portage +storage +boot +net +power +daemon"

RDEPEND="
    app-misc/screen
    app-editors/vim
    !app-editors/nano

    zsh? (
        app-shells/zsh
        app-shells/zsh-completions
        app-shells/gentoo-zsh-completions
    )
    
    sys-apps/usbutils
    sys-apps/pciutils
    sys-apps/i2c-tools
    
    sys-apps/moreutils
    app-text/tree
    app-misc/binwalk
    
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
        =>virtual/fstools-1.2.2
        net-ftp/vsftpd
        sys-apps/hdparm
        dev-vcs/git
        net-ftp/vsftpd
        sys-apps/smartmontools
    )
    boot? (
        sys-kernel/dracut
        sys-apps/kexec-tools
        sys-apps/flashrom
    )
    net? (
        net-analyzer/macchanger
        net-analyzer/nmap
        net-analyzer/traceroute
        net-firewall/nftables
        net-misc/iperf:3
        net-misc/socat
        net-misc/ntp
        net-analyzer/tcpdump
        net-misc/wol
        net-misc/dhcpcd
        net-misc/whois
        net-dns/bind-tools
        net-misc/socat
    )
    power? (
        sys-power/powertop
        sys-power/intel-undervolt
        sys-apps/lm-sensors
        sys-apps/ipmiutil
        sys-power/iasl
        sys-process/bashtop
    )
    daemon? (
        sys-process/cronie
        sys-process/at
        sys-power/thermald
    )
"