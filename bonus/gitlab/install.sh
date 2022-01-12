#!/usr/bin/env bash

set -e;

apt update && apt upgrade -y;

apt install -y curl openssh-server ca-certificates tzdata perl tmux;

debconf-set-selections <<< "postfix postfix/mailname string gitlab.com"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt install -y postfix


curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
EXTERNAL_URL="http://gitlab1337.com" apt install -y gitlab-ce
