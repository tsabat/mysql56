# MySQL 5.6 Playground

Fires up a vm with MySQL 5.6 installed, and provides scripts to backup and
restore our app-test database.  All you need to do is:

    vagrant up

The following command does a remote MySQL backup, note that you'll be prompted
from the 'unbounce' user's db password:

    bin/download-test-databases

Once that's downloaded, you can restore the backup with this command:

    bin/restore-test-databases-to-vm

Then you can have a look around with:

    vagrant ssh
    mysql -u root
