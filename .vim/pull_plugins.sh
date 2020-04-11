#!/bin/bash

cd ~/.vim
git pull

cd ~/.vim/bundle
for i in */.git; do ( echo $i; cd $i/..; git pull; ); done

