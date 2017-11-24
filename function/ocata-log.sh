#!/bin/bash
# -*- coding: utf-8 -*-
# vim: tabstop=4 shiftwidth=4 softtabstop=4
NAMEHOST=$HOSTNAME
function log_info ()
{
DATE_N=`date "+%Y-%m-%d %H:%M:%S"`
USER_N=`whoami`
echo "${DATE_N} ${USER_N} execute $0 [INFO] $@" >>/var/log/Openstack-CentOS7-Install.log

}

function log_error ()
{
DATE_N=`date "+%Y-%m-%d %H:%M:%S"`
USER_N=`whoami`
echo -e "${DATE_N} ${USER_N} execute $0 [ERROR] $@ "  >>/var/log/Openstack-CentOS7-Install.log

}

function fn_log ()  {
if [  $? -eq 0  ]
then
	log_info "$@ sucessed."
	echo -e "\033[32m $@ sucessed. \033[0m"
else
	log_error "$@ failed."
	echo -e "\033[41;37m $@ failed. \033[0m"
	exit
fi
}
