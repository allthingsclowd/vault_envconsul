# Base Template for project work

To use this base template for you own projects clone this repo to your desktop.

- __STEP 1__ (Only need to do this once for your workstation)

``` bash
git clone git@github.com:allthingsclowd/base.git
cd base
```

Then push this up to your new repository on github

- __STEP 2__

If using 2-Factor authentication on github you'll need to setup a [Personal Access Token.](https://blog.github.com/2013-05-16-personal-api-tokens/)

This is what I've stored in REPOTOKEN below

``` bash
curl -u allthingsclowd:${REPOTOKEN} https://api.github.com/user/repos -d '{"name":"mynewreponame"}'
git remote add mynewreponame git@github.com:allthingsclowd/mynewreponame.git
git push -u mynewreponame master
```

- __STEP 3__

Finally you can download and start working on your new templated repository as follows

``` bash
git clone git@github.com:allthingsclowd/mynewreponame.git
cd mynewreponame
```

All you need to do now is edit this ReadMe. Remove these instructions and fill in the blanks below.


# Title Here

## What does this do here?

![https://travis-ci.org/allthingsclowd/web_page_counter.svg?branch=master](https://travis-ci.org/allthingsclowd/web_page_counter.svg?branch=master)

## TODO

### Refactor



### A

* 

## Done

