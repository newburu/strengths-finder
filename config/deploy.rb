# config valid for current version and patch releases of Capistrano
lock "~> 3.19.1"

set :pty, true

# cloneするgitのレポジトリ
set :repo_url, ENV['DEPLOY_GIT_URL']

# deployするブランチ
set :branch, ENV['DEPLOY_BRANCH']

# シンボリックリンクをはるファイル
append :linked_files, ".env", "config/master.key", "public/ads.txt"

# シンボリックリンクをはるフォルダ
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/webpacker", "public/system", "vendor", "storage", "public/uploads"

# 保持するバージョンの個数
set :keep_releases, 5

# rbenvの設定
set :rbenv_type, :user
set :rbenv_ruby, '3.3.4'

# Pumaを再起動するための記述
namespace :deploy do
  desc "Make sure local git is in sync with remote."
  task :confirm do
    on roles(:app) do
      puts "This stage is '#{fetch(:stage)}'. Deploying branch is '#{fetch(:branch)}'."
      puts 'Are you sure? [y/n]'
      ask :answer, 'n'
      if fetch(:answer) != 'y'
        puts 'deploy stopped'
        exit
      end
    end
  end

  desc "Initial Deploy"
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc "Restart Application"
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke  'puma:stop'
      invoke! 'puma:start'
    end
  end

  before :starting, :confirm
end