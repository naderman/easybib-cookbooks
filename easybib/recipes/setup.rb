base_packages = [
  "htop", "jwhois", "multitail",
  "apache2-utils", "strace", "rsync",
  "manpages", "manpages-dev", "nscd",
  "subversion", "git-core", "unzip"
]

base_packages.each do |p|
  package p
end

gem_package "BibOpsworks"

service "nscd" do
  action :nothing
  supports [ :start, :stop, :restart, :reload ]
end


include_recipe "easybib::nginxstats"
include_recipe "easybib::cron"

if is_aws()
  include_recipe "easybib::opsworks-fixes"
end

# landscape is buggy
# https://bugs.launchpad.net/ubuntu/+source/pam/+bug/805423
package "landscape-client" do
  action :purge
end

# opsworks installs this but we don't need it
["ganglia-monitor", "libganglia1"].each do |p|
  package p do
    action :purge
  end
end
