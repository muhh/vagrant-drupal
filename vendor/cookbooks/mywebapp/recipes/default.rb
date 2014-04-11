#
# Cookbook Name:: mywebapp
# Recipe:: default
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

#
# Preparations
#

# Create webapp directory
directory "/var/www" do
  action :create
  owner "www-data"
  group "www-data"
  mode 00755
  recursive true
end

%w( docroot logs tmp ).each do |subdir|
  directory "/var/www/#{subdir}" do
    action :create
    owner "www-data"
    group "www-data"
    mode 00755
  end
end
