require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/bundler'
require 'capistrano3/unicorn'
require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git if ARGV[0] != 'docker-copy'
require 'capistrano/copy' if ARGV[0] == 'docker-copy'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
