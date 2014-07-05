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

if File.exists? "#{hs_root}/repos/#{castle}"
    execute "Update-homeshick" do 
        environment ({'HOME' => "#{node['sheiny-bootstrap']['user_home']}" })
        command "#{hs_loc}/bin/homeshick pull -b #{castle} &&
        #{hs_loc}/bin/homeshick link -b #{castle}"
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
