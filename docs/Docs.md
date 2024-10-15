# The IOC
```bash
[kiw94553@ws553 ~]$ configure-ioc show BL99P-CS-IOC-02
BL99P-CS-IOC-02 /dls_sw/prod/R3.14.12.7/ioc/BL99P/BL99P-CS-IOC-02/1-0/bin/linux-x86_64/stBL99P-CS-IOC-02.sh
```

Looking in `configure/RELEASE`, we find the following dependencies:

```bash
SUPPORT=/dls_sw/prod/R3.14.12.7/support
# Module definitions
AUTOSAVE = $(SUPPORT)/autosave/5-9dls2
CALC = $(SUPPORT)/calc/3-7
DEVIOCSTATS = $(SUPPORT)/devIocStats/3-1-14dls3-1
SNMP = $(SUPPORT)/snmp/1-03dls9
TERMINALSERVER = $(SUPPORT)/terminalServer/2-5
UTILITY = $(SUPPORT)/utility/dls2-19
# EPICS Base appears last
EPICS_BASE=/dls_sw/epics/R3.14.12.7/base
```

- AUTOSAVE: In ibek-support
- CACL: In ibek-support
- DEVIOCSTATS: Redundant
- SNMP: In ibek-support
- TERMINALSERVER: In ibek-support
- UTILITY: Redundant

All required modules are present!
We need to install them in the order 
1) CALC
2) AUTOSTAVE
3) SNMP
4) TERMINALSERVER