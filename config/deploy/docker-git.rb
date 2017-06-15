set :unicorn_rack_env, 'docker-git'

role :app, %w{unicorn}
server 'unicorn', user: 'app', roles: %w{app}
