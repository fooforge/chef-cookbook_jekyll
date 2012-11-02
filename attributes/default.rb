#
# Cookbook Name:: jekyll
# Attributes:: default
#
# Copyright 2012, Mike Adolphs
#
# Licensed under the MIT License, you may not use this file except in
# compliance with the License. You may obtain a copy of the License at
#
#     http://opensource.org/licenses/mit-license.php
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default['jekyll']['deploy_directory'] = '/var/www/jekyll'
default['jekyll']['repository'] = nil
default['jekyll']['reference'] = 'master'
default['jekyll']['user'] = 'root'
default['jekyll']['group'] = 'root'
default['jekyll']['access_rights'] = 0755

default['jekyll']['domain_name'] = node['fqdn']

default['jekyll']['packages'] = []
default['jekyll']['options'] = []

default['jekyll']['gem']['source'] = 'https://rubygems.org/'
default['jekyll']['gem']['binary'] = nil

default['jekyll']['rbenv']['activated'] = false
default['jekyll']['rbenv']['version'] = '1.9.3-p194'
