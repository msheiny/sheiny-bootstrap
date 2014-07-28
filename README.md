Sheiny-Bootstrap Cookbook
=========================
Tracking my Linux workstation settings, programs, and preferences. 

Prior to First Run
------------
Edit `attributes/default.rb`:

1. Add additional system packages that need to be installed
2. Modify `default["sheiny-bootstrap"]["user"]` to indicate the Linux user
you'd like to install home directory modifications for 

Install
-----

With a Chef server, you'll want to upload `sheiny-bootstrap` to your server using knife, include `sheiny-bootstrap` in your node's `run_list`, and then run chef-client:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[sheiny-bootstrap]"
  ]
}
```

Without running a chef server, the best way to get up and running is to utilize [Chef Zero](https://github.com/opscode/chef-zero) - which is awesome and built into the latest versions of Chef. Just clone this project to `./cookbooks/sheiny-bootstrap` and run:

```bash
sudo chef-client -z -o "sheiny-bootstrap"
```


License and Authors
-------------------
* Michael Sheinberg <m.sheiny@gmail.com>
