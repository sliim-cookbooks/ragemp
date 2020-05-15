# Cookbook:: ragemp
# Recipe:: default
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

package 'gcc'

remote_file "#{Chef::Config[:file_cache_path]}/ragemp-srv.tar.gz" do
  source "https://cdn.rage.mp/lin/ragemp-srv-#{node['ragemp']['version']}.tar.gz"
  owner 'root'
  group 'root'
  mode '0644'
  not_if "test -f #{Chef::Config[:file_cache_path]}/ragemp-srv.tar.gz"
  notifies :run, 'execute[untar-gz]', :immediately
end

execute 'untar-gz' do
  action :nothing
  command "tar xfz #{Chef::Config[:file_cache_path]}/ragemp-srv.tar.gz -C #{node['ragemp']['prefix']}"
end

file "#{node['ragemp']['prefix']}/ragemp-srv/server" do
  mode '0755'
end

file "#{node['ragemp']['prefix']}/ragemp-srv/conf.json" do
  mode '0644'
  content node['ragemp']['config'].to_json
end
