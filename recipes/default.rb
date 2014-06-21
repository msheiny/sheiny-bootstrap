#
# Cookbook Name:: sheiny-bootstrap
# Recipe:: default
#
#

node["sheiny-bootstrap"]["pkgs"].each do |pkg|
    package pkg do
        action :install
    end
end
