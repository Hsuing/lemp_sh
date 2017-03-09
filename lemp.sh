#!/bin/bash -
#===============================================================================
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Xiong.Han
#        E-MAIL: hxopensource.163.com
#  ORGANIZATION:
#   Create Time: 2016年01月28日 星期四 13时15分15秒
# Last Modified: 2016-01-28 13:15
#      REVISION:  ---
#===============================================================================
set -o nounset
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin

if [ $UID -ne 0 ];then
        echo -e "\033[31m [ Error:You must be root to install this script ] \033[0m"
        exit 1
fi


#php_install
function php_install_tools(){
	echo -e "\033[31m [ Checking for patch make gcc gcc-c++ libtool libtool-libs autoconf libjpeg libjpeg-devel libpng libpng-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers...... ] \033[0m"
	echo -e "\033[31m [ sleep 2s start install development tools  . ] \033[0m"
	sleep 2
	for i in patch make gcc gcc-c++ libtool libtool-libs autoconf libjpeg libjpeg-devel libpng libpng-devel gd gd-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2* bzip2-devel libevent libevent-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers php-cli php-mysql php-gd php-imap php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-mcrypt mcrypt php-mssql php-snmp php-soap libxml2* 
	do 
		yum install -y $i
	done
	yum -y groupinstall "Development tools"
	echo -e "\033[31m [ Checking for autoconf automake zlib zlib-devel openssl openssl-devel pcre pcre-devel gcc ...... ] \033[0m"
	yum install -y autoconf git automake zlib zlib-devel openssl openssl-devel pcre pcre-devel gcc
	clear
}
IS_TAR_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ tar Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ tar Failed!!! ] \033[0m"
                exit 0
        fi
}
IS_JPG_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make JPG Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make JPG Failed!!! ] \033[0m"
                exit 0
        fi
}

IS_PNG_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make PNG Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make PNG Failed!!! ] \033[0m"
                exit 0
        fi
}

IS_Freetype_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make Freetype Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make Freetype Failed!!! ] \033[0m"
                exit 0
        fi
}
IS_Curl_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make Curl Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make Curl Failed!!! ] \033[0m"
                exit 0
        fi
}
IS_Zlib_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make Zlib Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make Zlib Failed!!! ] \033[0m"
                exit 0
        fi
}

IS_PHP_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make PHP Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make PHP Failed!!! ] \033[0m"
                exit 0
        fi
}
IS_php_redis_extension_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make PHP_redis_extension Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make PHP_redis_extension Failed!!! ] \033[0m"
                exit 0
        fi
}
IS_NGINX_OK(){
        if [[ $? -eq 0 ]];then
                echo -e "\033[31m [ make NGINX Success!!! ] \033[0m"
        else
                echo -e "\033[31m [ make NGINX Failed!!! ] \033[0m"
                exit 0
        fi
}
#env
NUM=`grep "process" /proc/cpuinfo | wc -l`
COUNT=1
SLEEP="sleep $COUNT"

#Install_path
INSTALL_PATH=/data/application
SRC_UNZIP_PATH=/usr/local/src

#png env
PNG_NAME=libpng-1.2.31
PNG_TAR_NAME=libpng-1.2.31.tar.gz
PNG_INSTALL_PATH=${INSTALL_PATH}/${PNG_NAME}

#JPG env
JPG_NAME=jpeg
JPG_TAR_NAME=jpeg-6b.tar.gz
JPG_INSTALL_PATH=${INSTALL_PATH}/${JPG_NAME}

#Freetype env
Freetype_NAME=freetype-2.3.4
Freetype_TAR_NAME=freetype-2.3.4.tar.bz2
Freetype_INSTALL_PATH=${INSTALL_PATH}/${Freetype_NAME}

#Libiconv env
Libiconv_NAME=libiconv-1.14
Libiconv_TAR_NAME=libiconv-1.14.tar.gz
Libiconv_INSTALL_PATH=${INSTALL_PATH}/${Libiconv_NAME}

#Curl env
Curl_NAME=curl-7.41.0
Curl_TAR_NAME=curl-7.41.0.tar.bz2
Curl_INSTALL_PATH=${INSTALL_PATH}/${Curl_NAME}

#Zlib env
Zlib_NAME=zlib-1.2.7
Zlib_TAR_NAME=zlib-1.2.7.tar.gz
Zlib_INSTALL_PATH=${INSTALL_PATH}/${Zlib_NAME}

#PHP env
PHP_NAME=php-5.6.15
PHP_TAR_NAME=php-5.6.15.tar.xz
PHP_INSTALL_PATH=${INSTALL_PATH}/${PHP_NAME}

#php_redis_install env
PHP_redis_NAME=redis-2.2.5
PHP_redis_TAR_NAME=php_redis-2.2.5.tgz

#php_memcache_install env
PHP_memcache_NAME=memcache-3.0.6
PHP_memcache_TAR_NAME=php_memcache-3.0.6.tgz

#php_xcache_install env
PHP_xcache_NAME=xcache-3.2.0
PHP_xcache_TAR_NAME=xcache-3.2.0.tar.gz

#reture -
CD_RETRU_DIR="cd -"

#create dir

echo -e "\033[31m [ Create Install dir!!! ] \033[0m"
mkdir ${INSTALL_PATH} -pv

#install png
function png_install(){
	echo -e "\033[31m [ sleep ${COUNT}s start install PNG  . ] \033[0m"
	sleep 5 
#unzip
	if [ -d ${PNG_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${PNG_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${PNG_INSTALL_PATH} ];then
	#unzip
		tar zxvf ${PNG_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure png...... ] \033[0m"
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${PNG_NAME}
		./configure --prefix=${PNG_INSTALL_PATH} --enable-shared  &>/dev/null
		echo -e "\033[31m [ sleep 2s laster start make install...... ] \033[0m"
		${SLEEP}
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_PNG_OK
		${CD_RETRU_DIR} &>/dev/null
	else
		echo -e "\033[31m [ ${PNG_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
		echo -e "\033[31m [png install end...... ] \033[0m"
	echo 
}

#Install JPG 
function jpg_install(){
	echo -e "\033[31m [ sleep ${COUNT}s laster start JPG ...... ] \033[0m"
	sleep 2 
#unzip
	if [ -d ${JPG_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${JPG_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${JPG_INSTALL_PATH} ];then
	#unzip
		mkdir ${JPG_INSTALL_PATH}/{bin,lib,include,man} -p
		mkdir ${JPG_INSTALL_PATH}/man/man1

		tar zxvf ${JPG_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		echo -e "\033[31m [ sleep ${COUNT}s laster start cp config.sub config.guess /usr/local/src/jpeg... ] \033[0m"
		\cp /usr/share/libtool/config/config.guess ${SRC_UNZIP_PATH}/${JPG_NAME}/src
		\cp /usr/share/libtool/config/config.sub ${SRC_UNZIP_PATH}/${JPG_NAME}/src

		cd ${SRC_UNZIP_PATH}/${JPG_NAME}/src
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure JPG... ] \033[0m"
		${SLEEP}
		./configure --prefix=${JPG_INSTALL_PATH} --enable-shared &>/dev/null
		
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		${SLEEP}
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_JPG_OK
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ JPG install end...... ] \033[0m"
	else
		echo -e "\033[31m [ ${JPG_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
}

#install freetype
function freetype_install(){
	echo 
	echo -e "\033[31m [ sleep ${COUNT}s laster start freetype ...... ] \033[0m"
	sleep 2 
#unzip
	if [ -d ${Freetype_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${Freetype_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${Freetype_INSTALL_PATH} ];then
	#unzip
		tar jxvf ${Freetype_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${Freetype_NAME}
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure Freetype... ] \033[0m"
		${SLEEP}
		./configure --prefix=${Freetype_INSTALL_PATH} --enable-shared &>/dev/null
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		${SLEEP}
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_Freetype_OK	
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ Freetype install end...... ] \033[0m"
	else
		echo -e "\033[31m [ ${Freetype_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
}

#install libiconv
function Libiconv_install(){
	echo 
	echo -e "\033[31m [ sleep ${COUNT}s laster start Libiconv ...... ] \033[0m"
#unzip
	if [ -d ${Libiconv_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${Libiconv_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${Libiconv_INSTALL_PATH} ];then
	#unzip
		tar zxvf ${Libiconv_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${Libiconv_NAME}
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure Libiconv... ] \033[0m"
		./configure --prefix=${Libiconv_INSTALL_PATH} --enable-shared &>/dev/null
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		make -j ${NUM}  && make install 
		IS_Freetype_OK	
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ Libiconv install end...... ] \033[0m"
	else
		echo -e "\033[31m [ ${Libiconv_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
}

#install curl
function Curl_install(){
	echo 
	echo -e "\033[31m [ sleep 1s laster start Curl ...... ] \033[0m"
#unzip
	if [ -d ${Curl_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${Curl_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${Curl_INSTALL_PATH} ];then
	#unzip
		tar jxvf ${Curl_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${Curl_NAME}
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure Curl... ] \033[0m"
		./configure --prefix=${Curl_INSTALL_PATH} --enable-shared &>/dev/null
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_Curl_OK	
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ Curl install end...... ] \033[0m"
	else
		echo -e "\033[31m [ ${Curl_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
}

#install Zlib
function Zlib_install(){
	echo 
	echo -e "\033[31m [ sleep 1s laster start Zlib ...... ] \033[0m"
#unzip
	if [ -d ${Zlib_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${Zlib_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${Zlib_INSTALL_PATH} ];then
	#unzip
		tar zxvf ${Zlib_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${Zlib_NAME}
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure Zlib... ] \033[0m"
		./configure --prefix=${Zlib_INSTALL_PATH} --enable-shared &>/dev/null
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_Zlib_OK
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ Zlib install end...... ] \033[0m"
	else
		echo -e "\033[31m [ ${Zlib_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
}


#Install PHP
function PHP_install(){
	echo 
	echo -e "\033[31m [ sleep 1s laster start PHP...... ] \033[0m"
#unzip
	if [ -d ${PHP_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${PHP_INSTALL_PATH} existed...... ] \033[0m"
		exit 2
	fi
	if [ ! -d ${PHP_INSTALL_PATH} ];then
	#unzip
		tar Jxvf ${PHP_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${PHP_NAME}
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure PHP... ] \033[0m"
		./configure --prefix=${PHP_INSTALL_PATH}  \
--with-gd \
--with-jpeg-dir=${JPG_INSTALL_PATH} \
--with-freetype-dir=${Freetype_INSTALL_PATH} \
--with-png-dir=${PNG_INSTALL_PATH} \
--with-zlib=${Zlib_INSTALL_PATH} \
--with-curl=${Curl_INSTALL_PATH} \
--with-gettext \
--with-mysql \
--with-mysqli \
--with-mysql \
--with-mysqli \
--with-libxml-dir \
--with-libdir \
--with-xmlrpc \
--with-libxml-dir=/usr \
--with-openssl \
--with-mhash \
--with-xsl \
--disable-fileinfo \
--enable-gd-jis-conv \
--enable-dba \
--enable-pcntl \
--enable-sysvmsg \
--enable-sysvsem \
--enable-sysvshm \
--enable-mbstring=all \
--enable-sockets \
--enable-xml \
--enable-sockets \
--enable-zip \
--enable-soap \
--enable-ftp \
--enable-dom \
--enable-bcmath \
--enable-gd-native-ttf \
--enable-exif \
--enable-fpm \
--enable-debug
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_PHP_OK	
#cp php-fpm init
		echo -e "\033[31m [ cp sapi/fpm/init.d.php-fpm  to /etc/init.d/php-fpm...... ] \033[0m"
		if [ -f "/etc/init.d/php-fpm" ];then
			cp /etc/init.d/php-fpm{,.back}
			\cp -rf ${SRC_UNZIP_PATH}/${PHP_NAME}/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
		else
			\cp -rf ${SRC_UNZIP_PATH}/${PHP_NAME}/sapi/fpm/init.d.php-fpm /etc/init.d/php-fpm
		fi
		chmod u+x /etc/init.d/php-fpm
#config php-fpm.conf
cat >${PHP_INSTALL_PATH}/lib/php.ini<<EOF
[PHP]                                                                                                                                                         
engine = On                                                                                                                                                   
short_open_tag = On                                                                                                                                           
asp_tags = Off                                                                                                                                                
precision = 14                                                                                                                                                
y2k_compliance = On                                                                                                                                           
output_buffering = 4096                                                                                                                                       
zlib.output_compression = Off                                                                                                                                 
implicit_flush = Off                                                                                                                                          
unserialize_callback_func =                                                                                                                                   
serialize_precision = 100                                                                                                                                     
allow_call_time_pass_reference = Off                                                                                                                          
safe_mode = Off                                                                                                                                               
safe_mode_gid = Off                                                                                                                                           
safe_mode_include_dir =                                                                                                                                       
safe_mode_exec_dir =                                                                                                                                          
safe_mode_allowed_env_vars = PHP_                                                                                                                             
safe_mode_protected_env_vars = LD_LIBRARY_PATH                                                                                                                
disable_functions = "shell_exec,exec,system,passthru,proc_open,popen,pcntl_exec, socket_create,socket_create_listen"                                          
disable_classes =                                                                                                                                             
expose_php = Off                                                                                                                                              
max_execution_time = 30                                                                                                                                       
max_input_time = 60                                                                                                                                           
memory_limit = 128M                                                                                                                                           
error_reporting = E_ALL & ~E_DEPRECATED                                                                                                                       
display_errors = Off                                                                                                                                          
display_startup_errors = Off                                                                                                                                  
log_errors = On                                                                                                                                               
log_errors_max_len = 1024                                                                                                                                     
;extension = "/var/php-5.6.2/lib/php/extensions/no-debug-non-zts-20131226/curl.so"                                                                            
;extension = "/var/php-5.6.2/lib/php/extensions/no-debug-non-zts-20131226/gd.so"                                                                              
extension = "${PHP_INSTALL_PATH}/lib/php/extensions/debug-non-zts-20131226/redis.so"                                                                  
extension = "${PHP_INSTALL_PATH}/lib/php/extensions/debug-non-zts-20131226/memcache.so"                                                               
ignore_repeated_errors = Off                                                                                                                                  
ignore_repeated_source = Off                                                                                                                                  
report_memleaks = On                                                                                                                                          
track_errors = Off                                                                                                                                            
html_errors = Off                                                                                                                                             
variables_order = "GPCS"                                                                                                                                      
;request_order = "GP"                                                                                                                                         
request_order = "CGP"                                                                                                                                         
register_globals = Off                                                                                                                                        
register_long_arrays = Off                                                                                                                                    
register_argc_argv = Off                                                                                                                                      
auto_globals_jit = On                                                                                                                                         
post_max_size = 8M                                                                                                                                            
magic_quotes_gpc = Off                                                                                                                                        
magic_quotes_runtime = Off                                                                                                                                    
magic_quotes_sybase = Off                                                                                                                                     
;auto_prepend_file = /var/prefilter/filter.php                                                                                                                
auto_append_file =                                                                                                                                            
default_mimetype = "text/html"                                                                                                                                
doc_root =                                                                                                                                                    
user_dir =                                                                                                                                                    
enable_dl = Off                                                                                                                                               
file_uploads = On                                                                                                                                             
upload_max_filesize = 8M                                                                                                                                      
allow_url_fopen = On                                                                                                                                          
allow_url_include = Off                                                                                                                                       
default_socket_timeout = 60                                                                                                                                   
[Date]                                                                                                                                                        
date.timezone = PRC                                                                                                                                           
[filter]                                                                                                                                                      
[iconv]                                                                                                                                                       
[intl]                                                                                                                                                        
[sqlite]                                                                                                                                                      
[sqlite3]                                                                                                                                                     
[Pcre]                                                                                                                                                        
[Pdo]                                                                                                                                                         
[Phar]                                                                                                                                                        
[Syslog]                                                                                                                                                      
define_syslog_variables  = Off                                                                                                                                
[mail function]                                                                                                                                               
SMTP = localhost                                                                                                                                              
smtp_port = 25                                                                                                                                                
sendmail_path = /usr/sbin/sendmail -t -i                                                                                                                      
mail.add_x_header = On                                                                                                                                        
[SQL]                                                                                                                                                         
sql.safe_mode = Off                                                                                                                                           
[ODBC]                                                                                                                                                        
odbc.allow_persistent = On                                                                                                                                    
odbc.check_persistent = On                                                                                                                                    
odbc.max_persistent = -1                                                                                                                                      
odbc.max_links = -1                                                                                                                                           
odbc.defaultlrl = 4096                                                                                                                                        
odbc.defaultbinmode = 1                                                                                                                                       
[MySQL]                                                                                                                                                       
mysql.allow_persistent = On                                                                                                                                   
mysql.max_persistent = -1                                                                                                                                     
mysql.max_links = -1                                                                                                                                          
mysql.default_port =                                                                                                                                          
mysql.default_socket = "/data/mysql/3306/mysql.sock"                                                                                                          
mysql.default_host =                                                                                                                                          
mysql.default_user =                                                                                                                                          
mysql.default_password =                                                                                                                                      
mysql.connect_timeout = 60                                                                                                                                    
mysql.trace_mode = Off                                                                                                                                        
[MySQLi]                                                                                                                                                      
mysqli.max_links = -1                                                                                                                                         
mysqli.default_port = 3306                                                                                                                                    
mysqli.default_socket = "/data/mysql/3306/mysql.sock"                                                                                                         
mysqli.default_host =                                                                                                                                         
mysqli.default_user =                                                                                                                                         
mysqli.default_pw =                                                                                                                                           
mysqli.reconnect = Off                                                                                                                                        
[PostgresSQL]                                                                                                                                                 
pgsql.allow_persistent = On                                                                                                                                   
pgsql.auto_reset_persistent = Off                                                                                                                             
pgsql.max_persistent = -1                                                                                                                                     
pgsql.max_links = -1                                                                                                                                          
pgsql.ignore_notice = 0                                                                                                                                       
pgsql.log_notice = 0                                                                                                                                          
[Sybase-CT]                                                                                                                                                   
sybct.allow_persistent = On                                                                                                                                   
sybct.max_persistent = -1                                                                                                                                     
sybct.max_links = -1                                                                                                                                          
sybct.min_server_severity = 10                                                                                                                                
sybct.min_client_severity = 10                                                                                                                                
[bcmath]                                                                                                                                                      
bcmath.scale = 0                                                                                                                                              
[browscap]                                                                                                                                                    
[Session]                                                                                                                                                     
session.save_handler = files                                                                                                                                  
session.save_path = "/var/lib/php/session"                                                                                                                    
session.use_cookies = 1                                                                                                                                       
session.use_only_cookies = 1                                                                                                                                  
session.name = PHPSESSID                                                                                                                                      
session.auto_start = 0                                                                                                                                        
session.cookie_lifetime = 0                                                                                                                                   
session.cookie_path = /                                                                                                                                       
session.cookie_domain =                                                                                                                                       
session.cookie_httponly =                                                                                                                                     
session.serialize_handler = php                                                                                                                               
session.gc_probability = 1                                                                                                                                    
session.gc_divisor = 1000                                                                                                                                     
session.gc_maxlifetime = 1440                                                                                                                                 
session.bug_compat_42 = Off                                                                                                                                   
session.bug_compat_warn = Off                                                                                                                                 
session.referer_check =                                                                                                                                       
session.entropy_length = 0                                                                                                                                    
session.entropy_file =                                                                                                                                        
session.cache_limiter = nocache                                                                                                                               
session.cache_expire = 180                                                                                                                                    
session.use_trans_sid = 0                                                                                                                                     
session.hash_function = 0                                                                                                                                     
session.hash_bits_per_character = 5                                                                                                                           
url_rewriter.tags = "a=href,area=href,frame=src,input=src,form=fakeentry"                                                                                     
[MSSQL]                                                                                                                                                       
mssql.allow_persistent = On                                                                                                                                   
mssql.max_persistent = -1                                                                                                                                     
mssql.max_links = -1                                                                                                                                          
mssql.min_error_severity = 10                                                                                                                                 
mssql.min_message_severity = 10                                                                                                                               
mssql.compatability_mode = Off                                                                                                                                
mssql.secure_connection = Off                                                                                                                                 
[Assertion]                                                                                                                                                   
[COM]
[mbstring]
[gd]
[exif]
[Tidy]
tidy.clean_output = Off
[soap]
soap.wsdl_cache_enabled=1
soap.wsdl_cache_dir="/tmp"
soap.wsdl_cache_ttl=86400
[sysvshm]
[xcache-common]
extension = "${PHP_INSTALL_PATH}/lib/php/extensions/debug-non-zts-20131226/xcache.so"
[xcache.admin]
xcache.admin.enable_auth = On
xcache.admin.user = "xcache"
xcache.admin.pass = ""
[xcache]
xcache.shm_scheme = "mmap"
xcache.sie = 60M
xcache.count = 1
xcache.slots = 8K
xcache.ttl = 0
xcache.var_size = 4M
xcache.var_count = 1
xcache.var_slots = 8K
xcache.var_ttl = 0
xcache.var_maxttl = 0
xcache.var_gc_interval = 300
xcache.test = Off
xcache.readonly_protection= On
xcache.mmap_path = "${PHP_INSTALL_PATH}/xcache"
xcache.coredump_directory = ""
xcache.cacher = On
xcache.stat = On
xcache.optimizer = Off
[xcache.coverager]
xcache.coverager = On
xcache.coveragedump_directory = ""
EOF
#touch xcache file
		touch ${PHP_INSTALL_PATH}/xcache
		chown nginx.nginx ${PHP_INSTALL_PATH}/xcache
#php-fpm.conf
		\cp  ${PHP_INSTALL_PATH}/etc/php-fpm.conf.default ${PHP_INSTALL_PATH}/etc/php-fpm.conf
		PHP_FPM_CONF=${PHP_INSTALL_PATH}/etc/php-fpm.conf
		Mem=`free -m | awk '/Mem:/{print $2}'` 
		sed -i "s@^pm.max_children.*@pm.max_children = $(($Mem/2/20))@" ${PHP_FPM_CONF}
		sed -i "s@^pm.start_servers.*@pm.start_servers = $(($Mem/2/30))@" ${PHP_FPM_CONF}
		sed -i "s@^pm.min_spare_servers.*@pm.min_spare_servers = $(($Mem/2/40))@" ${PHP_FPM_CONF}
		sed -i "s@^pm.max_spare_servers.*@pm.max_spare_servers = $(($Mem/2/20))@" ${PHP_FPM_CONF}
		sed -i "s@^user.*@user = nginx@" ${PHP_FPM_CONF}
		sed -i "s@^group.*@group = nginx@" ${PHP_FPM_CONF}
		sed -i "s@^listen.*@listen = /tmp/php-fpm.sock@" ${PHP_FPM_CONF}
	
	
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ PHP install end...... ] \033[0m"
	else
		echo -e "\033[31m [ ${PHP_INSTALL_PATH} existed...... ] \033[0m"
		exit 1
	fi
	
}


#install 
function php_redis_install(){
	echo 
	echo -e "\033[31m [ sleep 1s laster start php_redis_install ...... ] \033[0m"
#unzip
	#unzip
		tar zxvf ${PHP_redis_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
		IS_TAR_OK
		${SLEEP}
		cd ${SRC_UNZIP_PATH}/${PHP_redis_NAME}
		echo -e "\033[31m [ start phpize...... ] \033[0m"
		/data/application/php-5.6.15/bin/phpize
		echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure PHP_redis_extension... ] \033[0m"
		echo -e "\033[31m [ start php-config...... ] \033[0m"
		./configure --with-php-config=/data/application/php-5.6.15/bin/php-config  &>/dev/null
		echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
		make -j ${NUM} &>/dev/null && make install &>/dev/null
		IS_php_redis_extension_OK
		${CD_RETRU_DIR} &>/dev/null
		echo -e "\033[31m [ PHP_redis_extension install end...... ] \033[0m"
}
PHP_memcache_NAME=memcache-3.0.6
PHP_memcache_TAR_NAME=php_memcache-3.0.6.tgz

#install
function php_memcache_install(){
        echo
        echo -e "\033[31m [ sleep 1s laster start php_memcache_install ...... ] \033[0m"
#unzip
        #unzip
                tar zxvf ${PHP_memcache_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
                IS_TAR_OK
                ${SLEEP}
                cd ${SRC_UNZIP_PATH}/${PHP_memcache_NAME}
                echo -e "\033[31m [ start phpize...... ] \033[0m"
                /data/application/php-5.6.15/bin/phpize
                echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure PHP_memcache_extension... ] \033[0m"
                echo -e "\033[31m [ start php-config...... ] \033[0m"
                ./configure --with-php-config=/data/application/php-5.6.15/bin/php-config  &>/dev/null
                echo -e "\033[31m [ sleep ${COUNT}s laster start make install...... ] \033[0m"
                make -j ${NUM} &>/dev/null && make install &>/dev/null
		if [ $? -eq 0 ];then
                	echo -e "\033[31m [ PHP_memcache_extension install success...... ] \033[0m"
		else
                	echo -e "\033[31m [ PHP_memcache_extension install Failed...... ] \033[0m"
		fi
		${CD_RETRU_DIR} &>/dev/null
}

#install xcache
function php_xcache_install(){
        echo
        echo -e "\033[31m [ sleep 1s laster start php_xcache_install ...... ] \033[0m"
#unzip
        #unzip
                tar zxvf ${PHP_xcache_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
                IS_TAR_OK
                ${SLEEP}
                cd ${SRC_UNZIP_PATH}/${PHP_xcache_NAME}
                echo -e "\033[31m [ start phpize...... ] \033[0m"
                /data/application/php-5.6.15/bin/phpize
                echo -e "\033[31m [ sleep ${COUNT}s laster start ./configure PHP_xcache_extension... ] \033[0m"
                echo -e "\033[31m [ start php-config...... ] \033[0m"
                ./configure --with-php-config=/data/application/php-5.6.15/bin/php-config  &>/dev/null
                echo -e "\033[31m [ sleep ${COUNT}s laster start make install PHP_xcache_extension... ] \033[0m"
                make -j ${NUM} &>/dev/null && make install &>/dev/null
                if [ $? -eq 0 ];then
                        echo -e "\033[31m [ PHP_xcache_extension install success...... ] \033[0m"
                else
                        echo -e "\033[31m [ PHP_xcache_extension install Failed...... ] \033[0m"
                fi
		${CD_RETRU_DIR} &>/dev/null
}


#Nginx env
Nginx_NAME=nginx-1.6.2
Nginx_TAR_NAME=nginx-1.6.2.tar.gz
Nginx_INSTALL_PATH=${INSTALL_PATH}/${Nginx_NAME}
NGINX_CONFIG=${Nginx_INSTALL_PATH}/conf/nginx.conf
NGINX_VHOST_path=${Nginx_INSTALL_PATH}/conf/vhost

#install nginx
function Nginx_install(){
	#
	NGINX_USER=nginx
	id ${NGINX_USER} &>/dev/null
        if [ $? -eq 0 ];then
		echo -e "\033[31m [ ${NGINX_USER} user haved existed. ] \033[0m"
		#exit 1
	else
		useradd ${NGINX_USER} -s /sbin/nologin
		echo -e "\033[31m [ ${NGINX_USER} user create successed. ] \033[0m"
	fi	
	if [ -d ${Nginx_INSTALL_PATH} ];then
		echo -e "\033[31m [ ${Nginx_INSTALL_PATH} existed  . ] \033[0m"
		exit 2
	fi
	#tar
	tar zxvf ${Nginx_TAR_NAME} -C ${SRC_UNZIP_PATH} &>/dev/null
	IS_TAR_OK
	#
	echo -e "\033[31m [ sleep ${COUNT}s  to judge ${NGINX_USER} user. ] \033[0m"
	${SLEEP}
	cd ${SRC_UNZIP_PATH}/${Nginx_NAME}
./configure \
--prefix=${Nginx_INSTALL_PATH} \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-http_ssl_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_gunzip_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_stub_status_module \
--with-http_auth_request_module \
--with-mail \
--with-mail_ssl_module \
--with-file-aio \
--with-ipv6 \
--with-http_spdy_module \
--with-cc-opt='-O2 -g -pipe -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -m64 -mtune=generic' &>/dev/null
	if [ $? -eq 0 ];then
		echo -e "\033[31m [ configure sucess!!  . ] \033[0m"
	else
		echo -e "\033[31m [ configure Failed!!  . ] \033[0m"
	fi
	
	echo -e "\033[31m [ sleep ${COUNT}s start make && make install  . ] \033[0m"
	${SLEEP}
        make -j ${NUM} &>/dev/null && make install &>/dev/null
	IS_NGINX_OK

	#
	echo -e "\033[31m [ create vhost dir  . ] \033[0m"
	mkdir -pv ${NGINX_VHOST_path}
	
	#reture dir
	${CD_RETRU_DIR} &>/dev/null

	echo -e "\033[31m [ sleep ${COUNT}s start touch nginx.conf  . ] \033[0m"
	${SLEEP}
	cp ${NGINX_CONFIG}{,.old-`date +%F`}
	\cp nginx.conf ${NGINX_CONFIG}
	
	echo -e "\033[31m [ create vhost conf  . ] \033[0m"
	\cp xxx.conf ${NGINX_VHOST_path}/
	
	echo -e "\033[31m [ create nginx script  . ] \033[0m"
	\cp nginx /etc/init.d/nginx
	chmod u+ /etc/init.d/nginx
	
	echo -e "\033[31m [ create web dir /data/web_data  . ] \033[0m"
	mkdir /data/web_data -pv
	cp index.php index.html  /data/web_data
    ln -sv ${Nginx_INSTALL_PATH}/conf /etc/nginx
    ln -sv ${Nginx_INSTALL_PATH}/logs /var/log/nginx
	
#
}

function TEST_OK(){
        #test nginx
        CURL_CMD=`curl -I localhost/index.html  >  test_web.log 2>/dev/null`
        GREP_CMD=`awk '$2 ~ /[0-9]/{print $2}' test_web.log | sed -n '1p'`
        /etc/init.d/nginx start
        if [ $? -eq 0 ];then
                echo -e "\033[31m [ web start success . ] \033[0m"
        else
                echo -e "\033[31m [ web start failed . ] \033[0m"
                exit 1
        fi
        if [ "${GREP_CMD}" == "200" ];then
                echo -e "\033[31m [ web static is ok  . ] \033[0m"
        else
                echo -e "\033[31m [ web static is not  . ] \033[0m"
        fi
        #dynamic
        /etc/init.d/php-fpm start &>/dev/null
        chown nginx.nginx /tmp/php-fpm.sock
        PHP_FPM_CMD=`ps -ef |grep php-fpm | egrep -v "(grep|master)" | wc -l`
        if [ ${PHP_FPM_CMD} -ne 0 ];then
                echo -e "\033[31m [ php-fpm start is ok  . ] \033[0m"
        else
                echo -e "\033[31m [ php-fpm start is not  . ] \033[0m"
                exit 0
        fi
        #test php
        CURL_CMD_PHP=`curl -I localhost/index.php  >  test_php.log 2>/dev/null`
        GREP_CMD_PHP=`awk '$2 ~ /[0-9]/{print $2}' test_php.log | sed -n '1p'`
        if [ "${GREP_CMD_PHP}" == "200" ];then
                echo -e "\033[31m [ web php is ok  . ] \033[0m"
        else
                echo -e "\033[31m [ web php is not  . ] \033[0m"
        fi
#
        TEST_MYSQL=`${PHP_INSTALL_PATH}/bin/php test_mysql.php`
        if [ ${TEST_MYSQL} -eq 1 ];then
                echo -e "\033[31m [ php link mysql is ok  . ] \033[0m"
        else
                echo -e "\033[31m [ php link mysql is not  . ] \033[0m"
                exit 0
        fi

}

#main
function Main(){
	#php_install_tools
	#png_install
	#jpg_install
	#freetype_install
	#Libiconv_install
	#Curl_install
	#Zlib_install
	PHP_install
	php_redis_install
	php_memcache_install
	php_xcache_install
	Nginx_install

#Install_Mysql
	sh mysql_single_auto_install.sh
}
Main
#Test_server
for((i=0; i<2; i++))
do
	TEST_OK
	echo 
done
#php env
echo -e 'PHP_PATH=/data/application/php-5.6.15/bin:$PATH\nexport PHP_PATH' >> /etc/profile
source /etc/profile
