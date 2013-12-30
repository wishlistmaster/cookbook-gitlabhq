include_recipe 'nginx'

# Ssl settings
if node[:gitlab][:https]
  https        = node[:gitlab][:https]
  ssl_cert_key = node[:gitlab][:webserver][:ssl_certificate_key]
  ssl_cert     = node[:gitlab][:webserver][:ssl_certificate]
  ssl_req      = node[:gitlab][:webserver][:ssl_req]

  execute 'create-ssl-key' do
    cwd '/etc/nginx'
    user  'root'
    group 'root'
    umask 0077
    command "openssl genrsa 2048 > #{ssl_cert_key}"
    not_if { !https || File.exists?(ssl_cert_key) }
  end

  execute 'create-ssl-cert' do
    cwd '/etc/nginx'
    user 'root'
    group 'root'
    umask 0077
    command "openssl req -subj \"#{ssl_req}\" -new -x509 -nodes -sha1 -days 3650 -key #{ssl_cert_key} > #{ssl_cert}"
    not_if { !https || File.exists?(ssl_cert) }
  end
end

# Disable default site
node.default['nginx']['default_site_enabled'] = false

# Register service
service 'nginx' do
  supports status: true, restart: true, reload: true
end
