# `--save` and `--save-dev`

`$ npm install xxx --save`

This will add `xxx` to `dependencies` in `package.json`, and `--save-dev` will add to `devDependencies`.

# publish, ERR & SOL
```
$ npm init
$ npm login
$ npm publish
```

```
npm ERR! no_perms Private mode enable, only admin can publish this module
SOL: $ npm config set registry http://registry.npmjs.org
```

```
npm ERR! You do not have permission to publish "npmtest". Are you logged in as the correct user? : npmtest
SOL: There is a same package name as yours. Change your package's name.
```

```
npm ERR! code ENEEDAUTH
npm ERR! need auth auth required for publishing
npm ERR! need auth You need to authorize this machine using `npm adduser`
SOL: $ npm add user
```

```
npm ERR! You cannot publish over the previously published versions: 1.0.0. : npmtest-tomfriwel
SOL: Change your package's version upper than current.
```


If you do not want publish all files, you can move your `package.json` to a specific folder and run publish command in that folder.
[How to npm publish specific folder but as package root](https://stackoverflow.com/questions/38935176/how-to-npm-publish-specific-folder-but-as-package-root)

Or add `.npmignore`