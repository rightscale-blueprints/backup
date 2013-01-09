Travis-ci status: [![Build Status](https://secure.travis-ci.org/jackl0phty/opschef-cookbook-fog.png?branch=master)](http://travis-ci.org/jackl0phty/opschef-cookbook-fog)

Description
===========

This cookbook will install FOG, a __F__ree and __O__pen __G__host server.

FOG has the ability to image the following platforms:

* Windos XP
* Windows Vista
* Windos 7
* limited Linux support

The project's homepage can be found at [fog](http://www.fogproject.org/)

Note about cookbook testing
===========================

This cookbook has only been tested against Linux Mint!

Supported Platforms
===================

The following platforms are supported by this cookbook:

* Debian
* Ubuntu
* Mint

Requirements
============

The following packages (based on Linux Mint) are required for FOG:

* mysql-client
* mysql-server
* php5
* isc-dhcp-server
* tftpd-hpa
* tftp-hpa
* nfs-kernel-server
* vsftpd
* net-tools
* wget
* xinetd
* sysv-rc-conf
* tar
* gzip
* build-essential
* cpp
* gcc
* g++
* m4
* htmldoc
* perl
* libcrypt-passwdmd5-perl
* lftp
* ssh
* php-gettext
* clamav-freshclam

Attributes
==========
<pre><code>
default['fog']['version'] = "0.32"
</pre></code>

Usage
=====

* You should only need to apply the __fog__ recipe if you're using Linux Mint.
Possibly the same thing for Debian/Ubuntu but I haven't tested that!

* You're MySQL root password should be in /etc/mysql/grants.sql.

* If you're MySQL password isn't blank, then you'll need to add it to /var/www/fog/commons/config.php 

* You'll need to execute /opt/fog_0.32/bin/installfog.sh as root or via sudo.
