set :application, "equalurl"
set :repository,  "."

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/home/deploy/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :none
set :deploy_via, :copy
set :user, "deploy"
set :copy_exclude, [".git", ".gitignore"]

role :app, "ds414-ubun1.blueboxgrid.com"
role :web, "ds414-ubun1.blueboxgrid.com"
role :db,  "ds414-ubun1.blueboxgrid.com", :primary => true
