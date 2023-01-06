#!/bin/bash

chmod 775 /usr/bin/MOTD.sh  # Set permissions on MOTD script
sed -i 's;session    optional     pam_motd.so  motd=/etd/motd;#session    optional     pam_motd.so  motd=/etc/motd;g' /etc/pam.d/sshd  # Set PAM to execute script upon each new session
sed -i 's;session    optional     pam_motd.so noupdate;#session    optional     pam_motd.so noupdate;g' /etc/pam.d/sshd  # Prevent MOTD from showing twice
sed -i 's;session    optional     pam_motd.so  motd=/run/motd.dynamic;#session    optional     pam_motd.so  motd=/run/motd.dynamic;g' /etc/pam.d/sshd  # Prevent MOTD from showing twice
printf 'session   optional   pam_exec.so   stdout /usr/bin/MOTD.sh\nsession   optional   pam_motd.so   motd=/etc/motd' | sudo tee -a /etc/pam.d/sshd  # Set PAM to execute script upon each new session
