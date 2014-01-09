require "bundler/gem_tasks"

gem_name = "json_bean-#{JsonBean::VERSION}.gem"

task :build do
	system "gem build json_bean.gemspec"
end

task :install => :build do
	system "rvm all do gem install #{gem_name}"
end

task :install_ay => :build do
	system "scp #{gem_name} admin@115.29.167.182:/home/admin/app/activity_talent_server/lib"
	system "ssh admin@115.29.167.182 /home/admin/.rvm/bin/rvm all do gem install /home/admin/app/activity_talent_server/lib/#{gem_name}"
end
