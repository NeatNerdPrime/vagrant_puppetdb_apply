Roles and profiles to setup a puppetdb in masterless mode
=========================================================

Setup
-----

Clone this repo.

Install all required modules from the forge:

* puppetdb
* apache

```
  puppet module install puppetlabs/puppetdb --modulepath <vagrant>/puppet/modules
  puppet module install puppetlabs/apache --modulepath <vagrant>/puppet/modules
```

Edit the example Vagrantfile.  This file assumes the vagrant hostmanager plugin is installed.
This is needed to setup the /etc/hosts files if the vagrant boxes.
I used the puppetlabs provided vagrant-libvirt boxes.  Templates for these boxes can be found
at https://github.com/puppetlabs/puppetlabs-packer. Boxes are installed with the aio puppet
agent package.

When the box names are changed, one need to change also the certnames in the __<vagrant>/puppet/manifests/site.pp__.

```
vagrant up 
vagrant ssh puppetdb
sudo
/vagrant/go_puppet.sh
```

repeat also on the client1 box.

How it works ?
--------------

This implements the SSL termination method mentioned at https://docs.puppet.com/puppetdb/latest/connect_puppet_apply.html.

Why ?
-----

Now you can play with exported resources without installing a full puppet master stack.

Tips
----

From the client, one can query puppetdb using following command :

```
curl -X GET --insecure "Accept: application/json" 'https://puppetdb.koewacht.net:8081/pdb/query/v4/resources' --data-urlencode 'query=["=","exported", true]'
```

On the pupeptdb, one can use the plain https port.

```
curl -X GET "Accept: application/json" 'http://localhost:8080/pdb/query/v4/resources' --data-urlencode 'query=["=","exported", true]'
```

Issues etc ?
------------

Any ideas, remarks may be filed as an issue.
And af course, PR's are welcome.

I hope someone does find this usefull one way are another.








