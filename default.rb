DOWNLOAD_DIR = '/tmp'
MYSQL_DOWNLOAD_URL = 'http://cdn.mysql.com/Downloads/MySQL-5.6/mysql-5.6.10-debian6.0-x86_64.deb'
MYSQL_DOWNLOAD_FILE = "#{DOWNLOAD_DIR}/mysql-5.6.10-debian6.0-x86_64.deb"

package "mysql-server-5.5"
package "mysql-client-5.5"
package "libaio1"

directory DOWNLOAD_DIR

remote_file MYSQL_DOWNLOAD_FILE do
  source MYSQL_DOWNLOAD_URL
  mode 0644
  action :create_if_missing
  checksum "b8f70c35e50cf49a4c8ed01d731b7d64"
end

template '/etc/my.cnf' do
  source 'my.cnf.erb'
  mode "0644"
end

template '/etc/profile.d/mysql56.sh' do
  source 'mysql56.sh.erb'
  mode "0644"
end

script 'install MySQL 5.6' do
  interpreter 'bash'
  user 'root'
  code <<-SCRIPT
    dpkg -i #{MYSQL_DOWNLOAD_FILE}
    cp /opt/mysql/server-5.6/support-files/mysql.server /etc/init.d/mysql.server
    update-rc.d mysql.server defaults
    chown -R mysql /opt/mysql/server-5.6/
    chgrp -R mysql /opt/mysql/server-5.6/
    service mysql stop
    apt-get remove mysql-server mysql-server-5.5 mysql-server-core-5.5
    rm /etc/mysql/my.cnf
    /opt/mysql/server-5.6/scripts/mysql_install_db --user=mysql --datadir=/var/lib/mysql
    rm /opt/mysql/server-5.6/my.cnf
    chmod 0744 /var/lib/mysql
    service mysql.server start
  SCRIPT
end

script 'load timezones' do
  interpreter 'bash'
  user 'root'
  code <<-SCRIPT
    /opt/mysql/server-5.6/bin/mysql_tzinfo_to_sql /usr/share/zoneinfo |mysql -u root mysql
  SCRIPT
end
