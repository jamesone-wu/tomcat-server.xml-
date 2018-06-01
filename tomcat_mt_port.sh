#!/bin/bash
##说明：每次替换备份一次server.xml 
##修改tomcat端口号
##脚本文件和修改的文件放在同一个目录
http_port="8008"
https_port="8408"
shutdown_port="8508"
ajp_port="8308"
conf_file=server.xml
script_file_dir=$(cd "$(dirname "$0")"; pwd)
echo "备份${conf_file}"
cp $conf_file `date +%Y%m%d%H%M%S`_$conf_file

echo "修改http端口为${http_port}"
sed -i 's#<Connector port=".*" protocol="HTTP/1.1"#<Connector port="'${http_port}'" protocol="HTTP/1.1"#g' ${script_file_dir}/${conf_file}
echo "修改shutdown端口为${shutdown_port}"
sed -i 's#<Server port=".*" shutdown="SHUTDOWN">#<Server port="'${shutdown_port}'" shutdown="SHUTDOWN">#g' ${script_file_dir}/${conf_file}
echo "修改ajp端口为${ajp_port}"
sed -i 's#<Connector port=".*" protocol="AJP/1.3"#<Connector port="'${ajp_port}'" protocol="AJP/1.3"#g' ${script_file_dir}/${conf_file}

grep 'http' server.xml
echo 'http查看'
grep 'shutdown' server.xml
echo 'shutdown_port查看'
grep 'ajp_port' server.xml
echo 'ajp_port查看'
