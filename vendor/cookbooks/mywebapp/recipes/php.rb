#
# Cookbook Name:: mywebapp
# Recipe:: php
# Author:: Markus Heurung <markus@freistil.it>
#
# Copyright 2014, freistil IT Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "php"

case node['platform']
when 'ubuntu'
  apt_repository "ondrej-php5-oldstable-#{node[:lsb][:codename]}" do
    uri 'http://ppa.launchpad.net/ondrej/php5-oldstable/ubuntu'
    distribution node[:lsb][:codename]
    components [:main]
    keyserver 'keyserver.ubuntu.com'
    key 'E5267A6C'
  end

  package 'php5' do
    action :upgrade
  end
else
  Chef::Log.warn("#{cookbook_name}::#{recipe_name} only supports ubuntu platform")
end

package "php5-memcache" do
  action :install
end

package "php5-gd" do
  action :install
end

package "php5-mysql" do
  action :install
end

# needed to install PEAR/PECL extension manually
include_recipe "build-essential::default"

package "libpcre3-dev" do
  action :install
end

php_pear "apc" do
  version "3.1.13"
  directives(:shm_size => "256M", :enable_cli => 0)
  action :install
end

php_pear "uploadprogress" do
  action :install
  notifies :reload, 'service[apache2]'
end