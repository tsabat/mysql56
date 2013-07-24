DOWNLOAD_DIR = '/vagrant/src'
MYSQL_DOWNLOAD_URL = 'http://codepen-dropbox.s3.amazonaws.com/mysql-5.6.12-debian6.0-x86_64.deb'
MYSQL_DOWNLOAD_FILE = "#{DOWNLOAD_DIR}/mysql-5.6.12-debian6.0-x86_64.deb"

package "mysql-server-5.5"
package "mysql-client-5.5"
package "libaio1"

directory DOWNLOAD_DIR

remote_file MYSQL_DOWNLOAD_FILE do
  source MYSQL_DOWNLOAD_URL
  mode 0644
  action :create_if_missing
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
  not_if "mysql --version | grep 5.6"
end
