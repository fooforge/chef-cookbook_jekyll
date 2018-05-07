execute "jekyll-build" do
  cwd node['jekyll']['deploy_directory']
  command "jekyll build"
  action :nothing
  only_if "test -f /var/chef/cache/jekyll_bootstrapped"
end

git node['jekyll']['deploy_directory'] do
  repository node['jekyll']['repository']
  reference node['jekyll']['reference']
  user node['jekyll']['user']
  group node['jekyll']['group']
  action :sync
  notifies :run, 'execute[jekyll-build]', :immediately
end

# Build command with options if defined for blog generation
unless node['jekyll']['options'].empty?
  options = node['jekyll']['options'].join(' ')
  jekyll_command = "#{node['jekyll']['command']} #{options}"
else
  jekyll_command = "#{node['jekyll']['command']}"
end

unless node['jekyll']['rbenv']['activated']
  execute 'Deploy Jekyll blog' do
    cwd node['jekyll']['deploy_directory']
    command "bundle install && #{jekyll_command} && touch /var/chef/cache/jekyll_bootstrapped"
    action :run
    not_if "test -f /var/chef/cache/jekyll_bootstrapped"
  end
else
  rbenv_script 'Deploy Jekyll blog' do
    rbenv_version node['jekyll']['rbenv']['version']
    root_path node['rbenv']['root_path']
    cwd node['jekyll']['deploy_directory']
    code %{ bundle install && source /etc/profile.d/rbenv.sh && #{jekyll_command} }
  end
end
