name              "easybib"
maintainer        "Till Klampaeckel"
maintainer_email  "till@php.net"
license           "BSD License"
description       "Tools we'd like on all servers."
version           "0.1"
recipe            "easybib::setup", "Installs some deps, invokes other recipies and purges ganglia and landscape."
recipe            "easybib::awscommand", "Installs Timothy Kay's aws command"
recipe            "easybib::nginxstats", "Script to show current stats."
recipe            "easybib::cron", "Configure MAILTO= in crontab"

supports 'ubuntu'

depends "apt"
depends "apache-solr"
depends "avahi"
depends "bash"
depends "composer"
depends "deploy"
depends "dnsmasq"
depends "gearmand"
depends "haproxy"
depends "loggly"
depends "memcache"
depends "newrelic"
depends "nginx-lb"
depends "nginx-app"
depends "pecl-manager"
depends "php-fpm"
depends "php-gearman"
depends "php-intl"
depends "php-mysqli"
depends "php-phar"
depends "php-opcache"
depends "php-poppler-pdf"
depends "php-posix"
depends "php-zip"
depends "php-zlib"
depends "php-suhosin"
depends "rsyslogd"
depends "snooze"
