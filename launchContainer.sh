Container_Name=${1:-${USER}'_ebpfExplore'}
Container_Image=${2:-"lamatriz/wlpu:ubuntu_20.04_ebpf_explore"}

SCRIPT_DIRECTORY=$(dirname $(readlink -f ${BASH_SOURCE[0]}))
SCRIPT_NAME=$(basename ${BASH_SOURCE[0]})

BCC_DIR=${SCRIPT_DIRECTORY}"/bcc"
echo ${BCC_DIR}
Constainer_results=${PWD}
echo "starting ${Container_Name} with image: ${Container_Image} and results dir ${Constainer_results} "
#docker run --privileged --security-opt seccomp=unconfined  -id  --name ${Container_Name}  -v ~/.ssh:/${USER}/.ssh -v ${Constainer_results}:/${USER}/wrk  --net=host ${Container_Image} bash
docker run --privileged --security-opt seccomp=unconfined  -id  --name ${Container_Name}   -v ${Constainer_results}:/${USER}/wrk  --net=host ${Container_Image} bash
docker exec -it ${Container_Name} bash
