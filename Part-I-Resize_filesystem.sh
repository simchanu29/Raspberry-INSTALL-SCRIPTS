#!/usr/bin/env bash

# to create the partitions programatically (rather than manually)
# we're going to simulate the manual input to fdisk
# The sed script strips off all the comments so that we can
# document what we're doing in-line with the actual commands
# Note that a blank line (commented as "defualt" will send a empty
# line terminated with a newline to take the fdisk default.
sed -e 's/\s*\([\+0-9a-zA-Z]*\).*/\1/' << EOF | fdisk ${TGTDEV}
   p # print
   d # delete partition
   2 # partition number 2
   n # new partition
   p # primary partition
   2 # partition number 2
    # default
    # default
   p # print
   w # write changes
   q # quit
EOF

# REBOOT REQUIRED