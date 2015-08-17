sheiny-bootstrap
------------------
![SleepyPup](https://raw.githubusercontent.com/msheiny/sheiny-bootstrap/master/img/sleepy-dog.png)


Used to be in chef, you can find that bad boy sitting in the chef branch. Now
it's in ansible, err salt - 
all these config managers are starting to blur together :(

Local Install
-------------

* Clone this guy down
* Jump into the directory
* Make any edits to `sheiny-bootstrap/map.jinja` necessary. Like `user`, `group`, homeshick `my_repo_name`
* Add any packages to `sheiny-bootstrap/packages.sls`
* Install salt-minion (2014.7+)
* Install brew (on Mac OSX)
* Call salt-call with local options (recommend running with test=true first)

```bash
git clone <this_git_url>
cd sheiny-bootstrap
sudo salt-call --local --file-root=./ state.sls sheiny-bootstrap #test=true
```
