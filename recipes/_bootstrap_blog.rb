unless node['jekyll']['packages'].empty?
  node['jekyll']['packages'].each do |pkg|
    package pkg do
      action :upgrade
    end
  end
end

unless node['jekyll']['rbenv']['activated']
  gem_package 'bundler' do
    source node['jekyll']['gem']['source']
    gem_binary node['jekyll']['gem']['binary']
    action :install
  end
else
  rbenv_gem 'bundler' do
    rbenv_version node['jekyll']['rbenv']['version']
    action :upgrade
  end
end

directory node['jekyll']['deploy_directory'] do
  owner node['jekyll']['user']
  group node['jekyll']['group']
  mode node['jekyll']['access_rights']

  recursive true
end
