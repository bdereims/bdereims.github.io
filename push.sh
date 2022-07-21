#!/bin/bash
#bdereims@gmail.com

bundle exec jekyll build
git add .
git commit -m "post"
git push
