return if node['jekyll']['apache']['enabled'] == false

domain_name = node['jekyll']['domain_name']

web_app "jekyll-#{domain_name}" do
  template 'web_app.conf.erb'
  docroot "#{node['jekyll']['deploy_directory']}/_site"
  server_name domain_name
  server_aliases [ 'localhost' ]
end
