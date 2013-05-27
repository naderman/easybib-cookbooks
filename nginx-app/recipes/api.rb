if is_aws()
  deploy_dir = "/srv/www/api/current/web"
  nginx_extras = ""
  if get_cluster_name() == "API Staging"
    default_router = "index_staging.php"
  else
    default_router = "index.php"
  end
  xhprof_enable = false
else
 deploy_dir = "/vagrant_data/web/"
 nginx_extras = "sendfile off;"
 default_router = "index_dev.php"
 xhprof_enable = true
end

template "/etc/nginx/sites-enabled/silex.conf" do
  source "silex.conf.erb"
  mode   "0755"
  owner  node["nginx-app"][:user]
  group  node["nginx-app"][:group]
  variables(
    :php_user    => node["php-fpm"][:user],
    :doc_root    => deploy_dir,
    :access_log  => 'off',
    :nginx_extra => nginx_extras,
    :default_router => default_router,
    :xhprof_enable => xhprof_enable
  )
  notifies :restart, resources(:service => "nginx"), :delayed
end
