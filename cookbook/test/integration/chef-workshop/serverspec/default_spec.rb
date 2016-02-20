require "serverspec"

USER = "vagrant"
PATH = "/opt/rbenv/bin:/opt/rbenv/shims:$PATH";

# Required by serverspec
set :backend, :exec
set :path, PATH

RSpec.configure do |c|
  user    = USER
end

# Ruby 2.2.2
describe package("ruby") do
  it { should be_installed }
end

describe command("ruby -v") do
  its(:stdout) { should match "2.2.2" }
end

# Node.js (required by Rails 3 asset pipeline)
describe package("nodejs") do
  it { should be_installed }
end

describe package('bundler') do
  it { should be_installed.by('gem') }
end

describe package('jquery-rails') do
  it { should be_installed.by('gem') }
end
