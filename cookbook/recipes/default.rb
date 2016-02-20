include_recipe "nodejs"
include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

rbenv_ruby '2.2.2' do
  global true
end

rbenv_gem 'bundler' do
  ruby_version '2.2.2'
end

rbenv_execute 'bundler' do
  command 'bundle install'
  cwd '/home/vagrant/workspace'
end
