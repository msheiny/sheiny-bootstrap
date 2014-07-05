# Pulled from https://github.com/shingara/oh-my-zsh-chef/
# 

git "#{node['sheiny-bootstrap']['user_home']}/.oh-my-zsh" do
  repository node['sheiny-bootstrap']["ohmyzsh_repo"]
  user node["sheiny-bootstrap"]["user"]
  reference "master"
  action :sync
end


user node["sheiny-bootstrap"]["user"] do 
    action :modify
    shell '/bin/zsh'
end


if platform?("debian", "ubuntu")
  execute "source /etc/profile to all zshrc" do
    command "echo 'source /etc/profile' >> /etc/zsh/zprofile"
    not_if "grep 'source /etc/profile' /etc/zsh/zprofile"
  end
end
