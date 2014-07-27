#
# Cookbook Name:: sheiny-bootstrap
# Recipe:: default
#
#

include_recipe "sheiny-bootstrap::packages" 
include_recipe "sheiny-bootstrap::homeshick" 
include_recipe "sheiny-bootstrap::zsh" 
include_recipe "sheiny-bootstrap::vim" 
if %x['runlevel'].split.last == "5" then
    include_recipe "sheiny-bootstrap::vbox" 
    include_recipe "sheiny-bootstrap::desktop" 
end
