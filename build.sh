#!/bin/bash

cd /tmp
wget fail2ban-latest.txt https://raw.githubusercontent.com/redoracle/docker_fail2ban/main/release-versions/fail2ban-latest.txt \
F2BVERSION=$(cat ./fail2ban-latest.txt) 
export FAIL2BAN_VERSION="$F2BVERSION" 
export TZ="UTC" 
curl -SsOL https://github.com/fail2ban/fail2ban/archive/${FAIL2BAN_VERSION}.zip 
unzip ${FAIL2BAN_VERSION}.zip 
cd fail2ban-${FAIL2BAN_VERSION} 
2to3 -w --no-diffs bin/* fail2ban 
python3 setup.py install 
