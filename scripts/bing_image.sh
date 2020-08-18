#!/bin/bash

nitrogen --restore

images_dir="$HOME/.local/share/wallpapers"

url_preffix="http://www.bing.com"
url_suffix=$(curl --no-progress-meter "http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1" | xmllint --xpath "string(//url)" -) || exit 1

url="$url_preffix$url_suffix"
name=$(echo $url | awk -F'&' '{print $2}' | awk -F'=' '{print $2}')
file_path="$images_dir/$name"
curl "$url" -o $file_path || exit 1

template="$HOME/scripts/bg-saved.cfg" 
config="$HOME/.config/nitrogen/bg-saved.cfg"
cp "$template" "$config" && \
sed -i "s|<==>|$file_path|g" "$config" && \
nitrogen --restore

