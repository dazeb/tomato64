#!/bin/bash

set -e

CONFIG=tomato_config.h

echo -n "" > $CONFIG

for feature in OPTIMIZE_SHARED_LIBS L2TP PPTP PPTPD MULTIWAN HTTPS SSH CIFS BRCM_NAND_JFFS2 JFFS2 JFFSV1 DDNS L7 L7PAT LZO OPENVPN WIREGUARD ZFS IPV6 EBTABLES EMF USB NOCAT NGINX MEDIA_SERVER FTP FTP_SSL SAMBASRV USB_EXTRAS NTFS BT BBT TR_EXTRAS NFS SNMP HFS UPS NANO DNSCRYPT STUBBY NVRAM_64K NVRAM_128K DRAM_512M TOR IPSEC RAID MICROSD AIO USBAP CTF NAND UFSDA TUXERA TUXERA_HFS BCMARM BCMWL6 BCMWL6A BCM7 BCM714 BCMSMP AC3200 AC5300 DHDAP GMAC3 PROXYSTA DPSTA GROCTRL BCMFA 5301X BCMDCS TRAFFIC_MGMT_RSSI_POLICY TOAD BCMBSD ROAM DNSSEC TINC OPENSSL11 FANCTRL IPERF QRCODE KEYGEN TERMLIB ADVTHEMES BLINK NVRAM_32K OPTIMIZE_SIZE OPTIMIZE_SIZE_MORE BONDING MDNS CONNTRACK_TOOL IRQBALANCE TRXKEY PROXY
do
	compare="TCONFIG_$feature"
	if [ "${!compare}" == y ]; then
		echo "#define TCONFIG_$feature 1" >> $CONFIG
		echo "  #define IF_TCONFIG_$feature(...) __VA_ARGS__" >> $CONFIG
		echo "  #define IF_NOT_TCONFIG_$feature(...)" >> $CONFIG
	else
		echo "#undef TCONFIG_$feature" >> $CONFIG
		echo "  #define IF_TCONFIG_$feature(...)" >> $CONFIG
		echo "  #define IF_NOT_TCONFIG_$feature(...) __VA_ARGS__" >> $CONFIG
	fi
done
