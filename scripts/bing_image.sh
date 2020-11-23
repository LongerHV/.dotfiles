#!/bin/bash

# initial wallpaper set
DISPLAY=":0" nitrogen --restore

# setting paths
images_dir="$HOME/.local/share/wallpapers"
template="$HOME/scripts/bg-saved.cfg" 
config="$HOME/.config/nitrogen/bg-saved.cfg"
url_preffix="http://www.bing.com"

# actual script
# url_suffix=$(curl --no-progress-meter "http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1" | xmllint --xpath "string(//url)" - | sed 's/1920x1080/2560x1440/g') && \
url_suffix=$(curl --no-progress-meter "http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1" | xmllint --xpath "string(//url)" -) && \
url="$url_preffix$url_suffix" && \
# echo $url && \
name=$(echo $url_suffix | awk -F'&' '{print $1}' | awk -F'=' '{print $2}') && \
file_path="$images_dir/$name" && \
curl "$url" -o $file_path && \
cp "$template" "$config" && \
sed -i "s|<==>|$file_path|g" "$config" && \
DISPLAY=":0" nitrogen --restore && \
exit 0

# return exitcode if above crashed
exit 1

