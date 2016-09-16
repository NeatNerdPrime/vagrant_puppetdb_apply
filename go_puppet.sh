#!/bin/bash

/opt/puppetlabs/bin/puppet apply /vagrant/puppet/manifests/site.pp  --modulepath=/vagrant/puppet/modules/
