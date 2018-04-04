
# install bundler

`$  gem install bundler`


# create a new project
`$ jekyll new project-name`

# run local server(http://127.0.0.1:4000):
`$ bundle exec jekyll serve`

# can not load `/assets/main.css` (view in console):

1. copy the assets folder of theme you are using to you resp

2. if is not `username.github.io` (exp: `username.gihub.io/blog`), add the line below to `_config.yml` and add a new branch `gh-pages`:

- resp: `https://github.com/username/blog` -> `baseurl: /blog`
- resp: `https://github.com/username/bloghello` -> `baseurl: /bloghello`
- resp: `https://github.com/username/username.github.io` -> don't need to set baseurl

```
...
baseurl: /blog
...
```

If build error or for test, in local run:

`$ bundle exec jekyll build`


# you can set value between `---` in post markdown file like:
```
---
title: a title
custom: custom content lalala
---

...
```

and use it by `post.custom` or `post.title`

# preview drafts

To preivew posts in `_drafts` folder:

`$ jekyll serve --drafts`

`$ bundle exec jekyll serve --drafts`

# order the same date posts

add a `date` field to YAML Front Matter just like:
```
---
# latest
date: '2018-03-15 18:02:12'
---


---
# older
date: '2018-03-15 13:02:12'
---
```