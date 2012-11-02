# chef-cookbook_jekyll

## Synopsis

This is a [Chef](http://www.opscode.com/chef) cookbook for deploying your [Jekyll](https://github.com/mojombo/jekyll) blog. Although it's in an early stage it has a couple of features to keep things flexible.

* Deployment via git
* Software prerequisites can be defined with an attribute
* Gem dependencies solved/installed via Bundler
* Support for additional jekyll command-line options
* Support for [rbenv](https://github.com/sstephenson/rbenv) via Fletcher Nichol's [rbenv cookbook](http://fnichol.github.com/chef-rbenv)
* Creates an Apache2 vhost for your blog

I haven't had the chance yet to test the cookbook besides my Debian-based environment and my own Jekyll blog. Therefore, please use it with caution and contribute if there're things that need to be fixed!

## Requirements

### Miscellaneous

* [Chef Solo](http://wiki.opscode.com/display/chef/Chef+Solo) or [Chef Server](http://wiki.opscode.com/display/chef/Chef+Server) environment
* A proper `Gemfile` in your blog's repository

### Chef dependencies

* apache2
* rbenv

## Usage

### Adding the cookbook

Download the cookbook via Opscode's API:

    knife cookbook site install jekyll

Or add it to your Librarian-chef `Cheffile`:

    cookbook 'jekyll',
      :git => 'https://github.com/fooforge/chef-cookbook_jekyll.git'

### Configuration

The best way to configure the cookbook for your blog is to add a specific role for it and to set needed attributes via `default_attributes`.

Here's an example:

    name "jekyll_blog-fooforge.com"
    description "Installs the Jekyll blog fooforge.com."
    # List of recipes and roles to apply. Requires Chef 0.8, earlier versions use 'recipes()'.
    run_list(
      'recipe[jekyll]'
    )
    # Attributes applied if the node doesn't have it set already.
    default_attributes(
      'jekyll' => {
        'deploy_directory' => '/var/www/fooforge.com',
        'repository' => 'https://github.com/fooforge/fooforge.com.git',
        'user' => 'some_user',
        'group' => 'some_group',
        'domain_name' => 'fooforge.com',
        'packages' => ['curl', 'libcurl4-openssl-dev', 'python-pygments'],
        'options' => ['rdiscount', 'pygments'],
        'rbenv' => {
          'activated' => true,
          }
      }
    )
    # Attributes applied no matter what the node has set already.
    #override_attributes(
    #)

For a full list of attributes please consult `./attributes/default.rb`.

## Development

* Source hosted at [GitHub](https://github.com/fooforge/chef-cookbook_jekyll)
* Report issues/Questions/Feature requests on [GitHub](https://github.com/fooforge/chef-cookbook_jekyll/issues) as well

Pull requests are very welcome! Make sure your patches are well tested.

## License

Copyright (c) 2012 Mike Adolphs

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.