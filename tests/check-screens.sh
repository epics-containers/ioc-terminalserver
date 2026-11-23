#!/bin/bash

# Generate the runtime assets with no terminal server attached and check that
# the device and iocStats screens are among them. The IOC binary is not run:
# with no SNMP agent answering, iocInit waits on a timeout for each output
# record, and a 32 channel Moxa has 386 of them.
# The generated screens are left in the folder given as the second argument.

TAG=${1:?usage: check-screens.sh <image> <opi output folder>}
OPI=${2:?usage: check-screens.sh <image> <opi output folder>}
THIS=$(realpath $(dirname $0))

mkdir -p ${OPI}
chmod 777 ${OPI}

docker run --rm --security-opt=label=disable \
    -v ${THIS}/screens-config:/epics/ioc/config:ro \
    -v ${OPI}:/epics/opi \
    ${TAG} /epics/ioc/start.sh --test 2>&1 | tail -5

ls -la ${OPI}

status=0
for screen in TerminalServer32 TerminalServerAcs32 MoxaChannel AcsChannel iocAdminSoft; do
    if [[ ! -f ${OPI}/${screen}.pvi.bob ]]; then
        echo "ERROR: no generated screen for ${screen}"
        status=1
    fi
done
exit ${status}
