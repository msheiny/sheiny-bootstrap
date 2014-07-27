Sheiny-Bootstrap Cookbook
=========================
Basic tools that I need to get anything done on my workstations.

Prior to Install
------------
Edit `attributes/default.rb`:

1. Add additional system packages that need to be installed
2. Modify `default["sheiny-bootstrap"]["user"]` to indicate the Linux user
you'd like to install home directory modifications for 

Install
-----

Include `sheiny-bootstrap` in your node's `run_list` to install everything:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sheiny-bootstrap]"
  ]
}
```

Check the recipes folder to target a specific bootstrap component (such as
setting up the home directory, installing system packages, etc.)

The quickest way to do install is to utilize `chef-zero`. Clone this project
to `cookbooks/sheiny-bootstrap` and run:

```bash
sudo chef-client -o "sheiny-bootstrap"
```


License and Authors
-------------------
* Michael Sheinberg 
