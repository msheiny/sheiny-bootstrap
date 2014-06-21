Sheiny-Bootstrap Cookbook
=========================
Basic tools that I need to get anything done on my workstations.

Tweaking
------------
Edit `attributes/default.rb` to tweak system packages that get installed

Usage
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


License and Authors
-------------------
* Michael Sheinberg 
