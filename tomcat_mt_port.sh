#!/bin/bash
##˵����ÿ���滻����һ��server.xml 
##�޸�tomcat�˿ں�
##�ű��ļ����޸ĵ��ļ�����ͬһ��Ŀ¼
http_port="8008"
https_port="8408"
shutdown_port="8508"
ajp_port="8308"
conf_file=server.xml
script_file_dir=$(cd "$(dirname "$0")"; pwd)
echo "����${conf_file}"
cp $conf_file `date +%Y%m%d%H%M%S`_$conf_file

echo "�޸�http�˿�Ϊ${http_port}"
sed -i 's#<Connector port=".*" protocol="HTTP/1.1"#<Connector port="'${http_port}'" protocol="HTTP/1.1"#g' ${script_file_dir}/${conf_file}
echo "�޸�shutdown�˿�Ϊ${shutdown_port}"
sed -i 's#<Server port=".*" shutdown="SHUTDOWN">#<Server port="'${shutdown_port}'" shutdown="SHUTDOWN">#g' ${script_file_dir}/${conf_file}
echo "�޸�ajp�˿�Ϊ${ajp_port}"
sed -i 's#<Connector port=".*" protocol="AJP/1.3"#<Connector port="'${ajp_port}'" protocol="AJP/1.3"#g' ${script_file_dir}/${conf_file}

grep 'http' server.xml
echo 'http�鿴'
grep 'shutdown' server.xml
echo 'shutdown_port�鿴'
grep 'ajp_port' server.xml
echo 'ajp_port�鿴'
