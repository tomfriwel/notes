# Setup development environment

`$ npm install weex-toolkit -g`

`$ weex create awesome-app`

```
cd awesome-app
npm install
npm start
```

# iOS

```
weex platform add ios
cd platforms/ios/
pod install
```
If:

```
Ignoring commonmarker-0.17.8 because its extensions are not built.  Try: gem pristine commonmarker --version 0.17.8
/Library/Ruby/Site/2.3.0/rubygems.rb:271:in `find_spec_for_exe': can't find gem cocoapods (>= 0.a) (Gem::GemNotFoundException)
	from /Library/Ruby/Site/2.3.0/rubygems.rb:299:in `activate_bin_path'
	from /usr/local/bin/pod:23:in `<main>'
```

then run `$ sudo gem install cocoapods` to get the latest stable version

[Updating to latest version of cocoapods?](https://stackoverflow.com/questions/39481636/updating-to-latest-version-of-cocoapods)


# [Weex入门与进阶指南](http://blog.csdn.net/jasonblog/article/details/51863173)