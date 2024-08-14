set :application, ENV['PRODUCTION_DEPLOY_APP_NAME']

server ENV['PRODUCTION_SERVER_IP'], user: ENV['PRODUCTION_SERVER_USER'], roles: %w{app db web}, port: ENV['PRODUCTION_SERVER_PORT'] 

set :ssh_options, {
  auth_methods: ['publickey'], 
  keys: ENV['PRODUCTION_SERVER_SSH_KEY'],
}

# deploy先のディレクトリ
set :deploy_to, "/home/#{ENV['PRODUCTION_SERVER_USER']}/#{ENV['PRODUCTION_DEPLOY_APP_NAME']}"
set :deploy_via, :remote_cache

# Pumaの設定
set :puma_systemctl_user,       "#{ENV['PRODUCTION_SERVER_USER']}"
set :puma_threads,    [4, 16]
set :puma_workers,    0
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true
