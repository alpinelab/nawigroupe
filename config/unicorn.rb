worker_processes 2
timeout 60
preload_app true

before_fork do |server, worker|
  sleep 1
end

after_fork do |server, worker|
end

