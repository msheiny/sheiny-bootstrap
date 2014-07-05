hs_loc = "#{node['sheiny-bootstrap']['user_home']}/.homesick/repos/homeshick"
castle = "#{node['sheiny-bootstrap']['my_repo_name']}"
hs_clone = "#{node['sheiny-bootstrap']['my_repo_user']}/#{node['sheiny-bootstrap']['my_repo_name']}"

[ "#{node['sheiny-bootstrap']['user_home']}/.homesick", 
    "#{node['sheiny-bootstrap']['user_home']}/.homesick/repos" ].each do |path|
    directory path do 
        owner node["sheiny-bootstrap"]["user"]
        group node["sheiny-bootstrap"]["user"]
        action :create
        recursive true
    end
end

git "#{hs_loc}" do 
    repository node["sheiny-bootstrap"]["homeshick"]
    action :sync
    user node["sheiny-bootstrap"]["user"]
    group node["sheiny-bootstrap"]["user"]
end


if File.exists? "#{hs_loc}/#{castle}"
    execute "Update-homeshick" do 
        command "#{hs_loc}/bin/homeshick pull -b #{castle}"
        action :run
    end
else
    execute "Clone-homeshick" do 
        command "#{hs_loc}/bin/homeshick clone -b #{hs_clone}"
        action :run
    end
end
