node 'client1.koewacht.net' {

  include ::roles::puppetdb::masterless::client

}

node 'puppetdb.koewacht.net' {

  include ::roles::puppetdb::masterless::server

}
