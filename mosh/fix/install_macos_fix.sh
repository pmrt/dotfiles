#!/bin/bash
# MacOS fix to:
# Firewall GUI won't allow mosh to work
# https://github.com/mobile-shell/mosh/issues/898
plist_file="com.mosh.plist"
fix_script="mosh_macos_fix.sh"

# ensure correct permissions
sudo chmod 744 $fix_script
sudo chmod 744 $plist_file
sudo chown root:wheel $fix_script
sudo chown root:wheel $plist_file

# store script for all users
script_dir="/Users/Shared/.boot"
launch_daemons_dir="/Library/LaunchDaemons"
fix_dir="$HOME/.config/mosh/fix"
mkdir -p $script_dir
sudo ln -sf "${fix_dir}/${plist_file}" "${launch_daemons_dir}/${plist_file}"
sudo ln -sf "${fix_dir}/${fix_script}" "${script_dir}/${fix_script}"

sudo launchctl load -w "${launch_daemons_dir}/${plist_file}"
