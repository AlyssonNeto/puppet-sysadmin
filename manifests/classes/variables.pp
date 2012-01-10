class variables {
    case $operatingsystem {
      centos: { $apache = "httpd" }
      # Note that these matches are case-insensitive.
      redhat: { $apache = "httpd" }
      debian: { $apache = "apache2" }
      ubuntu: { $apache = "apache2" }
      default: { fail("Unrecognized operating system for webserver") }
      # "fail" is a function. We'll get to those later.
    }
    case $operatingsystem {
      centos: { $apache_conf = "/etc/httpd/conf/httpd.conf" }
      # Note that these matches are case-insensitive.
      redhat: { $apache_conf = "httpd" }
      debian: { $apache_conf = "/etc/apache2/apache2.conf" }
      ubuntu: { $apache_conf = "apache2" }
      default: { fail("Unrecognized operating system for webserver") }
      # "fail" is a function. We'll get to those later.
    }
}
