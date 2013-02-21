# MySQL 5.6 Playground

Fires up a virtual machine with MySQL 5.6 installed, and provides scripts to 
backup and restore our app-test database.  All you need to do is:

    vagrant up

During provisioning, you'll notice that MySQL 5.5 gets installed.  Don't panic,
that's just to get some of the system dependencies in place, as the manual
dpkg install of MySQL 5.6 doesn't do all that.

You'll also notice that the first time you provision it takes quite a while to
download the MySQL 5.6 .deb file (several minutes depending on your connection
speed).  However, we keep it around in the tmp directory so that you won't have
to download it again if want to re-provision the virtual machine.

Once provisioning is complete, you'll have a virtual machine with MySQL 5.6 up
and running.  You can then backup and download our test databases with the
following (note that you'll be asked for the 'unbounce' user's database
password):

    bin/download-test-databases

Once that's downloaded, you can restore the backup with this command:

    bin/restore-test-databases-to-vm

Then you can have a look around with:

    vagrant ssh
    mysql -u root

Note that if you 
