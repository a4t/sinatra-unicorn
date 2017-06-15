set :application, 'sinatra-unicorn'
set :repo_url, 'git@github.com:a4t/sinatra-unicorn.git'
set :branch, 'master'
set :deploy_to, '/app'
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets}
set :bundle_without, %i(deploy development test)
set :keep_releases, 5

set :unicorn_config_path, -> { release_path.join('config/unicorn.rb') }

after 'deploy:symlink:release', 'deploy:set_file'
after 'deploy:publishing', 'deploy:restart'

namespace :deploy do
  desc 'set release date file'
  task :set_file do
    on roles(:app) do
      within current_path do
        execute "date +'%Y-%m-%d %H:%M:%S' > #{current_path}/deploy_time"
      end
    end
  end

  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
  end
end
