################################################################################
#
# libshared
#
################################################################################

LIBSHARED_VERSION = 1.0
LIBSHARED_SITE = $(BR2_EXTERNAL_TOMATO64_PATH)/package/libshared/shared
LIBSHARED_SITE_METHOD = local
LIBSHARED_INSTALL_STAGING = YES
LIBSHARED_LICENSE = tomato
LIBSHARED_DEPENDENCIES = libnvram busybox

ifeq ($(BR2_PACKAGE_RC_BT),y)
export TCONFIG_BT=y
endif

ifeq ($(BR2_PACKAGE_RC_CIFS),y)
export TCONFIG_CIFS=y
endif

ifeq ($(BR2_PACKAGE_RC_DDNS),y)
export TCONFIG_DDNS=y
endif

ifeq ($(BR2_PACKAGE_RC_DNSCRYPT),y)
export TCONFIG_DNSCRYPT=y
endif

ifeq ($(BR2_PACKAGE_RC_DNSSEC),y)
export TCONFIG_DNSSEC=y
endif

ifeq ($(BR2_PACKAGE_RC_EBTABLES),y)
export TCONFIG_EBTABLES=y
endif

ifeq ($(BR2_PACKAGE_RC_FTP),y)
export TCONFIG_FTP=y
endif

ifeq ($(BR2_PACKAGE_RC_HTTPS),y)
export TCONFIG_HTTPS=y
endif

ifeq ($(BR2_PACKAGE_RC_IPV6),y)
export TCONFIG_IPV6=y
endif

ifeq ($(BR2_PACKAGE_RC_MDNS),y)
export TCONFIG_MDNS=y
endif

ifeq ($(BR2_PACKAGE_RC_MULTIWAN),y)
export TCONFIG_MULTIWAN=y
endif

ifeq ($(BR2_PACKAGE_RC_NFS),y)
export TCONFIG_NFS=y
endif

ifeq ($(BR2_PACKAGE_RC_NGINX),y)
export TCONFIG_NGINX=y
endif

ifeq ($(BR2_PACKAGE_RC_NOCAT),y)
export TCONFIG_NOCAT=y
endif

ifeq ($(BR2_PACKAGE_RC_OPENVPN),y)
export TCONFIG_OPENVPN=y
endif

ifeq ($(BR2_PACKAGE_RC_PPTPD),y)
export TCONFIG_PPTPD=y
endif

ifeq ($(BR2_PACKAGE_RC_SAMBA),y)
export TCONFIG_SAMBASRV=y
endif

ifeq ($(BR2_PACKAGE_RC_SNMP),y)
export TCONFIG_SNMP=y
endif

ifeq ($(BR2_PACKAGE_RC_SSH),y)
export TCONFIG_SSH=y
endif

ifeq ($(BR2_PACKAGE_RC_STUBBY),y)
export TCONFIG_STUBBY=y
endif

ifeq ($(BR2_PACKAGE_RC_TINC),y)
export TCONFIG_TINC=y
endif

ifeq ($(BR2_PACKAGE_RC_TOR),y)
export TCONFIG_TOR=y
endif

ifeq ($(BR2_PACKAGE_RC_UPS),y)
export TCONFIG_UPS=y
endif

ifeq ($(BR2_PACKAGE_RC_USB),y)
export TCONFIG_USB=y
endif

export TCONFIG_OPTIMIZE_SHARED_LIBS=y
export TCONFIG_L2TP=y
export TCONFIG_PPTP=y
export TCONFIG_JFFS2=y
export TCONFIG_L7=y
export TCONFIG_L7PAT=y
export TCONFIG_LZO=y
export TCONFIG_WIREGUARD=y
export TCONFIG_ZFS=y
export TCONFIG_EMF=y
export TCONFIG_MEDIA_SERVER=y
export TCONFIG_FTP_SSL=y
export TCONFIG_USB_EXTRAS=y
export TCONFIG_NTFS=y
export TCONFIG_BBT=y
export TCONFIG_TR_EXTRAS=y
export TCONFIG_HFS=y
export TCONFIG_NANO=y
export TCONFIG_NVRAM_64K=y
export TCONFIG_AIO=y
export TCONFIG_CTF=y
export TCONFIG_NAND=y
export TCONFIG_UFSDA=y
export TCONFIG_BCMARM=y
export TCONFIG_BCMWL6=y
export TCONFIG_BCMWL6A=y
export TCONFIG_BCMSMP=y
export TCONFIG_DPSTA=y
export TCONFIG_GROCTRL=y
export TCONFIG_BCMBSD=y
export TCONFIG_OPENSSL11=y
export TCONFIG_IPERF=y
export TCONFIG_QRCODE=y
export TCONFIG_KEYGEN=y
export TCONFIG_TERMLIB=y
export TCONFIG_ADVTHEMES=y
export TCONFIG_BONDING=y
export TCONFIG_CONNTRACK_TOOL=y
export TCONFIG_IRQBALANCE=y
export TCONFIG_TRXKEY=y
export TCONFIG_PROXY=y

define LIBSHARED_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) genconfig
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) libshared.so
endef

define LIBSHARED_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libshared.so $(STAGING_DIR)/usr/lib
	$(INSTALL) -D -m 0644 $(@D)/tomato_config.h $(STAGING_DIR)/usr/include
endef

define LIBSHARED_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/libshared.so $(TARGET_DIR)/usr/lib
endef

$(eval $(generic-package))
