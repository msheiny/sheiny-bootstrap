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
]

if platform?("ubuntu")
    default["sheiny-bootstrap"]["pkgs"].concat([
       "dnsutils",
       "python3-minimal",
       "linux-source",
       "exuberant-ctags",
       "virtualenvwrapper"
    ])
end

if platform_family?("rhel","fedora")
    default["sheiny-bootstrap"]["pkgs"].concat([
        "python-virtualenvwrapper",    
    ])
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

gh = "https://github.com"
default["sheiny-bootstrap"]["my_repo_name"], repo_name = "dotsheiny"
default["sheiny-bootstrap"]["my_repo_user"], repo_user = "msheiny"
default["sheiny-bootstrap"]["git_home"] = "#{gh}/#{repo_user}/#{repo_name}.git"
default["sheiny-bootstrap"]["homeshick"] = "#{gh}/andsens/homeshick.git"
