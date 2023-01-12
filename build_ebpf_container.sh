local_tag=${2:-"ubuntu_20.04_ebpf_explore"}
dockerfile=${1:-"Dockerfile"}
container_image_local="lamatriz/wlpu:${local_tag}"

docker build -t ${container_image_local}  -f ${dockerfile} .
docker push ${container_image_local}
