class apache {
    package { $apache:
      ensure => latest,
      before => File[$apache_conf],
    }

    file { $apache_conf:
      ensure => file,
      mode   => 600,
      source => 'puppet:///etc/apache2/apache2.conf',
      recurse => true,
    }

    file { '/etc/${apache_process}/conf.d':
      ensure  => directory,
      source  => 'puppet:///files/etc/apache2/conf.d',
      recurse => true,
    }

    file { '/etc/${apache_process}/sites-available':
      ensure  => directory,
      source  => 'puppet:///files/etc/apache2/conf.d',
      recurse => true,
    }

    file { '/etc/${apache_process}/sites-enabled':
      ensure  => directory,
    }

    service { $apache:
      ensure     => running,
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
      subscribe  => File[$apache_conf],
    }  
}
