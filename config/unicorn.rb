app_path = '/app'

worker_processes ENV['SINATRA_ENV'] == 'production' ? 2 : 1
working_directory "#{app_path}/current"

timeout 300
listen 3000

pid "#{app_path}/shared/tmp/pids/unicorn.pid"

stderr_path "#{app_path}/shared/log/unicorn.stderr.log"
stdout_path "#{app_path}/shared/log/unicorn.stdout.log"

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('../Gemfile', File.dirname(__FILE__))
end

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
