import "classes/*.pp"

node sysadmin_lamp {
  include apache
}

node 'noaa.drupalpeople.com' inherits sysadmin_lamp {

}


