set :spinner_user, nil
set :runner, 'root'
set :application, "theyworkforeu"
set :github_user, "threedaymonk"

# ssh_options[:port] = 2222

set :user, 'root'
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion
set :scm_user, github_user
default_run_options[:pty] = true
set :repository,  "git://github.com/#{github_user}/#{application}.git"
set :scm, "git"
#set :user, "deployer"

role :app, "65.99.217.185"
role :web, "65.99.217.185"
role :db,  "65.99.217.185", :primary => true

namespace :deploy do
  desc "The spinner task is used by :cold_deploy to start the application up"
  task :spinner, :roles => :app do
    send(run_method, "/etc/init.d/mongrel_cluster restart")
    send(run_method, "/etc/init.d/nginx restart")
  end
  
  desc "The start task is used by :cold_deploy to start the application up"
  task :start, :roles => :app do
    send(run_method, "/etc/init.d/mongrel_cluster restart")
    send(run_method, "/etc/init.d/nginx restart")
  end
  
  desc "Restart the mongrel cluster"
  task :restart, :roles => :app do
    send(run_method, "/etc/init.d/mongrel_cluster restart")
    send(run_method, "/etc/init.d/nginx restart")
  end
  
  desc "A setup task to put shared system, log, and database directories in place"
  task :setup_shared, :roles => [:app, :db, :web] do
  run <<-CMD
  mkdir -p -m 775 #{release_path} #{shared_path}/system #{shared_path}/db &&
  mkdir -p -m 777 #{shared_path}/log
  CMD
  end
end