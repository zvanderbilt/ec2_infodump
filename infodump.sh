#!/bin/bash



echo p > /proc/sysrq-trigger #                      (dumps current CPU registers and flags)
echo m > /proc/sysrq-trigger  #                     (dumps information about memory allocation)
echo t > /proc/sysrq-trigger   #                    (dumps thread state information)
echo w > /proc/sysrq-trigger    #                   (dumps tasks that are in uninterruptable (blocked) state)

sleep 1

uname -a > /tmp/uname.out
ifconfig > /tmp/ifcongfig.out
top -n 5 -b > /tmp/top.out
vmstat 1 50 > /tmp/vm.out
iostat -x 2 10 > /tmp/io.out
ps aux > /tmp/ps.out
ps auxH > /tmp/psh.out
sar -A > /tmp/sar.out
free > /tmp/free.out
lsof > /tmp/lsof.out
sysctl -a > /tmp/sysctl.out

sleep 1

tar -czvf outputs.tar.gz /tmp/*.out
tar -czvf messages.tar.gz /var/log/messages

echo "ALL DONE!"

exit 0
