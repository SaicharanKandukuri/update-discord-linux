#!/bin/bash

# --------
# DISCORD UPDATE SCRIPT
#
# Authored by zman
#

# check for sudo
[[ $EUID != 0 ]] && {
  echo "[*] run with sudo"
  echo "ex: sudo ${0}"
}

tmp_file="/tmp/discord-update.deb"
[[ -f $tmp_file ]] && rm -rvf $tmp_file 
url="https://discord.com/api/download/stable?platform=linux&format=deb"

echo "[*] Attempting to download discord"
axel -o "$tmp_file" $url || {
  echo "[*] Failed to download discord"
  exit 1
}

echo "[*] Attempting to install discord $tmp_file"
dpkg -i $tmp_file || {
  echo "[*] Attempt to update/install discord failed.."
  rm -rvf $tmp_file
  exit 1
}


echo "[*] Installation complete, removing tmp file"
rm -rvf $tmp_file

echo "[*] Script completed..."
