### install sepecify version(upgrade or downgrade)

- [Upgrade Node.js to the latest version on Mac OS](https://stackoverflow.com/a/19333717/6279975)

Here's how I successfully upgraded from `v0.8.18` to `v0.10.20` **without any other requirements** like brew etc, (type these commands in the terminal):

1. `sudo npm cache clean -f` (force) clear you npm cache
2. `sudo npm install -g n` install [n][1] (this might take a while)
3. `sudo n stable` upgrade to the current stable version

*Note that `sudo` might prompt your password.*  

*Additional note regarding step 3: `stable` can be exchanged for `latest`, `lts` (long term support) or any specific version number such as `0.10.20`.*

If the version number doesn't show up when typing `node -v`, you might have to reboot.


These instructions are found here as well: [davidwalsh.name/upgrade-nodejs][2]  
More info about the **n** package found here: [npmjs.com/package/n][1]  
More info about Node.js' release schedule: [github.com/nodejs/Release][3]


  [1]: https://www.npmjs.com/package/n
  [2]: https://davidwalsh.name/upgrade-nodejs
  [3]: https://github.com/nodejs/Release#release-schedule


LTS:
12.13.0
16.13.0

```sh
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
# or specify version
sudo n 12.13.0
```