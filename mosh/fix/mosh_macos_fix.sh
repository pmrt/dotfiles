#!/bin/bash
#
# Title: Mosh MacOS firewall fix
# Author: Pedro J. Martinez <s+moshfix@pedro.to>
# Ref: https://github.com/mobile-shell/mosh/issues/898
#
# Fix for mosh-server not being allowed by macos firewall so users don't have to
# disable firewall in order for Mosh to work.
#
# The naive implementation of the script in this issue was using KeepAlways in
# in the launchd com.mosh.plist but the SuccessfulExit was true. So script would
# run forever every 10s because it returned zero error code (see `man
# launchd.plist`)
#
# This version is meant to be called by a launchd job with a SuccessfulExit
# false (see `man launchd.plist`). SuccessfulExit with flag = false will execute
# this script as long as it still exits with error codes != 0 (success). So this
# script will return error code = 2 until macos firewall process is found. After
# that it will wait 3min before applying the rules, ensuring that our rules are
# applied correctly.

function log() {
  local msg=$1
  local errorCode=$2

  echo "[$(date +"%H:%M:%S")]: $msg"

  if [[ -n $2 ]]; then
    exit $errorCode
  fi
}

if ! pgrep -x "socketfilterfw" > /dev/null
then
  # Exit with errorCode = 2 if firewall is not running
  log "Firewall is not running, exiting..." 2
fi

# If firewall is found, we wait 3 min just in case it's still being initialized
log "Firewall process found. Scheduling rules to be applied in 3 min..."
sleep 180

fw='/usr/libexec/ApplicationFirewall/socketfilterfw'
mosh="$(which mosh-server)"

# Disable firewall
sudo "${fw}" --setglobalstate off

# add mosh to firewall
sudo "${fw}" --add "${mosh}"
sudo "${fw}" --unblockapp "${mosh}"

# Enable firewall
sudo "${fw}" --setglobalstate on

log "mosh_macos_fix: firewall rules applied"
