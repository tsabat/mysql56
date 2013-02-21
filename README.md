# MySQL 5.6 Playground

Fires up a vm with MySQL 5.6 installed, and provides scripts to backup and
restore our app-test database.  All you need to do is:

    vagrant up
    bin/download-test-databases
    bin/restore-test-databases-to-vm

Then you can have a look around with:

    vagrant ssh
    mysql -u root
