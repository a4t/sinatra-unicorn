set :unicorn_rack_env, 'docker-copy'
set :scm, :copy

role :app, %w{unicorn}
server 'unicorn', user: 'app', roles: %w{app}
