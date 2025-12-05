# Zabbix: Kernel Info

Monitors kernel information for current running kernel version, latest kernel version available and if a reboot i s necessary

## Setup on the target server

The script "kernel_info.sh" has to be copied into the "/etc/zabbix/scripts/" folder and the "userparameter_kernelc.onf" has to be copied into the "/etc/zabbix/zabbix_agentd.conf.d/" or "/etc/zabbix/zabbix_agentd.d/" folder depending on the installation.

On some systems a symlink might need to be created from the "zabbix_agentd.conf.d/" to the "zabbix_agentd.d/" folder. Please check your setup if this is nedeed.

If the script "kernel_info.sh" is located in a different folder the "userparameter_kernel.conf" has to be updated to reflect this change.

## Setup in Zabbix

Import the template "template_module_linux_kernel_information.json" into Zabbix and add it to the servers where the kernel change should be monitored
