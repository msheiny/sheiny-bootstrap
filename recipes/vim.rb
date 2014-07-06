
home = node['sheiny-bootstrap']['user_home']


[ "#{home}/.vim", "#{home}/.vim/bundle", "#{home}/.fonts",
        "#{home}/.fonts.conf.d"].each do |path|
    directory path do 
        owner node["sheiny-bootstrap"]["user"]
        group node["sheiny-bootstrap"]["user"]
        action :create
    end
end

git "#{home}/.vim/bundle/Vundle.vim" do
    repository node['sheiny-bootstrap']['vundle_repo']
    user node["sheiny-bootstrap"]["user"]
    reference "master"
    action :sync
end

execute "Vundle-Plugin-Install" do
    environment ({'HOME' => "#{node['sheiny-bootstrap']['user_home']}" })
    command "vim +PluginInstall +qall"
    user node["sheiny-bootstrap"]["user"]
    action :run
end

cookbook_file "PowerlineSymbols.otf" do
    path "/usr/share/fonts/PowerlineSymbols.otf"
end

execute "Update-Font-Cache" do
    command "fc-cache -vf"
    action :run
end

cookbook_file "10-powerline-symbols.conf" do
    path "/etc/fonts/conf.d/10-powerline-symbols.conf"
end
