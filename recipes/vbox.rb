cookbook_file "virtualbox.repo" do
    path "/etc/yum.repos.d/virtualbox.repo"
    action :create
end

package "dkms"
package "VirtualBox-#{node['sheiny-bootstrap']['vbox_version']}"


remote_file "#{Chef::Config[:file_cache_path]}/vagrant" do
    source node["sheiny-bootstrap"]["vagrant_latest"]
    action :create
end

package "vagrant" do
    source "#{Chef::Config[:file_cache_path]}/vagrant"
    action :install
end
