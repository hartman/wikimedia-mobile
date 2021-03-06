set :application, "mobile"
set :repository,  "git://github.com/hcatlin/wikimedia-mobile.git"

set :scm, :git
set :user, "deploy"
set :deploy_to, "/srv/#{application}"

role :web, "mobile1.wikimedia.org"
role :cache, "mobile1.wikimedia.org"

namespace :deploy do
  task :restart do
    deploy.stop
    deploy.start
  end
  
  task :start do
    begin
      run "/etc/init.d/thin start"
    rescue
      retry
    end
  end
  
  task :stop do
    begin
      run "/etc/init.d/thin stop"
    rescue
    end
  end
end