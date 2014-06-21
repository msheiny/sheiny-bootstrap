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
