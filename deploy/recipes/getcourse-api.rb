include_recipe "php-fpm::service"

node['deploy'].each do |application, deploy|

  next unless allow_deploy(application, 'api', 'api-server')

  opsworks_deploy_dir do
    user  deploy["user"]
    group deploy["group"]
    path  deploy["deploy_to"]
  end

  easybib_deploy "getcourse-api" do
    deploy_data deploy
    app application
    envvar_json_source "getcourse"
  end

  service "php-fpm" do
    action :reload
  end

end
