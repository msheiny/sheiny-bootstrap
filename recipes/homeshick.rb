hs_root = "#{node['sheiny-bootstrap']['user_home']}/.homesick"
hs_loc = "#{hs_root}/repos/homeshick"
castle = "#{node['sheiny-bootstrap']['my_repo_name']}"
hs_clone = "#{node['sheiny-bootstrap']['my_repo_user']}/#{node['sheiny-bootstrap']['my_repo_name']}"

[ "#{hs_root}", "#{hs_root}/repos" ].each do |path|
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

if File.exists? "#{hs_root}/repos/#{castle}"
    execute "Update-homeshick" do 
        environment ({'HOME' => "#{node['sheiny-bootstrap']['user_home']}" })
        command "#{hs_loc}/bin/homeshick pull -f #{castle} &&
        #{hs_loc}/bin/homeshick link -f #{castle}"
        user node["sheiny-bootstrap"]["user"]
        action :run
    end
else
    execute "Pull-Down-homeshick" do 
        environment ({'HOME' => "#{node['sheiny-bootstrap']['user_home']}" })
        command "#{hs_loc}/bin/homeshick -f clone #{hs_clone} && 
                #{hs_loc}/bin/homeshick -f link #{castle}"
        user node["sheiny-bootstrap"]["user"]
        action :run
    end
end
