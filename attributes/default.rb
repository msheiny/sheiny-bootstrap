require 'etc'

default["sheiny-bootstrap"]["user"] = "vagrant"
user_obj = Etc.getpwnam(node["sheiny-bootstrap"]["user"])
default["sheiny-bootstrap"]["user_home"] = user_obj.dir
default["sheiny-bootstrap"]["user_group"] = Etc.getgrgid(user_obj.gid).name


default["sheiny-bootstrap"]["pkgs"] = [
  "git",
  "tmux",
  "tree",
  "htop",
  "vim",
  "mutt",
  "python-pip",
  "ipython",
  "ruby",
  "tcpdump",
  "nmap",
  "telnet",
  "screen",
  "wget",
  "gcc",
  "make",
  "fontconfig",
  "zsh"
]

if platform?("ubuntu")
    default["sheiny-bootstrap"]["pkgs"].concat([
       "dnsutils",
       "python3-minimal",
       "linux-source",
       "exuberant-ctags",
       "virtualenvwrapper",
       "locate"
    ])
end

if platform_family?("rhel","fedora")
    default["sheiny-bootstrap"]["pkgs"].concat([
        "python-virtualenvwrapper",    
    ])

    # Check if we are running a fedora desktop
    if %x['runlevel'].split.last == "5" and 
      platform_family?("fedora") then
        default["sheiny-bootstrap"]["pkgs"].concat([
            "firefox",
            "mono-core", # Needed for KeePass
            "mono-winforms", # Needed for KeePass
            "gimp",
            "libreoffice",
            "wine",
            "geany-plugins-markdown"
        ])
    end
end

if platform?("opensuse")
    default["sheiny-bootstrap"]["pkgs"].concat([
        "bind-utils",
        "python3-base",
        "findutils-locate",
        "kernel-source",
        "ctags"
    ])
end


########################## GIT ##############################################
gh = "https://github.com"
default["sheiny-bootstrap"]["my_repo_name"], repo_name = "dotsheiny"
default["sheiny-bootstrap"]["my_repo_user"], repo_user = "msheiny"
default["sheiny-bootstrap"]["git_home"] = "#{gh}/#{repo_user}/#{repo_name}.git"
default["sheiny-bootstrap"]["homeshick"] = "#{gh}/andsens/homeshick.git"

default["sheiny-bootstrap"]["ohmyzsh_repo"] = "#{gh}/robbyrussell/oh-my-zsh.git"
default["sheiny-bootstrap"]["vundle_repo"] = "#{gh}/gmarik/Vundle.vim.git"

########################## Virtualization ###################################

default["sheiny-bootstrap"]["vbox_version"] = "4.3"

if platform_family?("rhel","fedora")
    default["sheiny-bootstrap"]["vagrant_latest"] = "https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.rpm"
end
