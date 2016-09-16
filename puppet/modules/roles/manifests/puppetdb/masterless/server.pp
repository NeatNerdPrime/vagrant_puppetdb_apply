class roles::puppetdb::masterless::server {

  include ::profiles::puppetdb::masterless::server
  include ::profiles::puppetdb::masterless::client

}
