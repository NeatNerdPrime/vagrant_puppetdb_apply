#
# This module is used to setup the puppetlabs repos
# that can be used to install puppet AIO packages.
#
class puppetrepos {

  if($::osfamily == 'Debian') {
    Apt::Source {
      location    => 'http://apt.puppetlabs.com',
      key         => {
        'id'     => '47B320EB4C7C375AA9DAE1A01054B7A24BD6EC30',
        'server' => 'pgp.mit.edu',
      },
    }
    apt::source { 'puppetlabs':      repos => 'PC1' }
  } elsif $::osfamily == 'Redhat' {
    if $::operatingsystem == 'Fedora' {
      $ostype='fedora'
      $prefix='f'
    } else {
        $ostype='el'
        $prefix=''
    }

    yumrepo { 'puppetlabsAIO':
      baseurl  => "http://yum.puppetlabs.com/${ostype}/${prefix}\$releasever/PC1/\$basearch",
      descr    => 'Puppet Labs Products AIO $releasever - $basearch',
      enabled  => '1',
      gpgcheck => '1',
      gpgkey   => 'http://yum.puppetlabs.com/RPM-GPG-KEY-puppetlabs',
    }
  } else {
    fail("Unsupported osfamily ${::osfamily}")
  }
}
