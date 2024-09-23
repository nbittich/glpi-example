- run `docker compose up -d`
- go to http://localhost and follow the instructions:
  sql server is: mysql
  db user/password are: glpi/glpi
  use the existing database: glpi

After following the steps, you should see this:

```
Default logins / passwords are:
glpi/glpi for the administrator account
tech/tech for the technician account
normal/normal for the normal account
post-only/postonly for the postonly account
```

- Login using glpi admin account
- Enable GLPI Inventory under Administatrion/inventory
- Install the glpi agent on your machine:

- https://github.com/glpi-project/glpi-agent/releases
- for linux users:

```
wget https://github.com/glpi-project/glpi-agent/releases/download/1.10/glpi-agent-1.10-linux-installer.pl
chmod a+x glpi-agent-1.10-linux-installer.pl
# when setting up, use the following url (reply empty for other questions):
# http://localhost/front/inventory.php
sudo ./glpi-agent-1.10-linux-installer.pl
sudo glpi-agent --debug
```
