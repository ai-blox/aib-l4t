#!/bin/bash

# verify that git is installed
if  ! which git > /dev/null  ; then
  echo "ERROR: git is not installed. If your linux distro is 10.04 or later,"
  echo "git can be installed by 'sudo apt-get install git-core'."
  exit 1
fi

SOURCE_INFO="
k:kernel/kernel-4.9:linux-4.9.git:l4t-kernel-kernel-4.9.git:
k:kernel/nvgpu:linux-nvgpu.git:l4t-kernel-nvgpu.git:
k:kernel/nvidia:linux-nvidia.git:l4t-kernel-nvidia.git:
k:hardware/nvidia/soc/t18x:device/hardware/nvidia/soc/t18x.git:l4t-hardware-nvidia-soc-t18x.git:
k:hardware/nvidia/platform/tegra/common:device/hardware/nvidia/platform/tegra/common.git:l4t-hardware-nvidia-platform-tegra-common.git:
k:hardware/nvidia/platform/t18x/common:device/hardware/nvidia/platform/t18x/common.git:l4t-hardware-nvidia-platform-t18x-common.git:
k:hardware/nvidia/platform/t18x/quill:device/hardware/nvidia/platform/t18x/quill.git:l4t-hardware-nvidia-platform-t18x-quill.git:
k:hardware/nvidia/soc/t210:device/hardware/nvidia/soc/t210.git:l4t-hardware-nvidia-soc-t210.git:
k:hardware/nvidia/platform/t210/common:device/hardware/nvidia/platform/t210/common.git:l4t-hardware-nvidia-platform-t210-common.git:
k:hardware/nvidia/platform/t210/jetson:device/hardware/nvidia/platform/t210/jetson.git:l4t-hardware-nvidia-platform-t210-jetson.git
k:hardware/nvidia/platform/t210/porg:device/hardware/nvidia/platform/t210/porg.git:l4t-hardware-nvidia-platform-t210-porg.git:
k:hardware/nvidia/soc/t19x:device/hardware/nvidia/soc/t19x.git:l4t-hardware-nvidia-soc-t19x.git:
k:hardware/nvidia/platform/t19x/common:device/hardware/nvidia/platform/t19x/common.git:l4t-hardware-nvidia-platform-t19x-common.git:
k:hardware/nvidia/platform/t19x/galen/kernel-dts:hardware/nvidia/platform/t19x/stardust-dts.git:l4t-hardware-nvidia-platform-t19x-galen-kernel-dts.git:
k:hardware/nvidia/platform/t19x/jakku/kernel-dts:device/hardware/nvidia/platform/t19x/jakku-dts.git:l4t-hardware-nvidia-platform-t19x-jakku-kernel-dts.git:
k:hardware/nvidia/soc/tegra:device/hardware/nvidia/soc/tegra.git:l4t-hardware-nvidia-soc-tegra.git:
u:u-boot:3rdparty/u-boot.git:l4t-u-boot.git
"

# exit on error on sync
EOE=0
# after processing SOURCE_INFO
NSOURCES=0
declare -a SOURCE_INFO_PROCESSED

function Usage {
	echo "Use: $0 [options]"
	echo "Available general options are,"
	echo "  -h : Help"
	echo "  -c : Checkout TAG"
	echo "  -s : Sync fork with NVIDIA repo"	

}

function SyncFork {
	local SOURCE_DIR
	local UPSTREAM_REPO
	
	for ((i=0; i < NSOURCES; i++)); do
		SOURCE_DIR=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 2 -d ':')
		UPSTREAM_REPO=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 3 -d ':')

		pushd ${SOURCE_DIR} > /dev/null
			echo "Sync ${SOURCE_DIR}"
			git remote remove upstream 2>/dev/null
			git remote add upstream "git://nv-tegra.nvidia.com/${UPSTREAM_REPO}" 2>/dev/null 
			git fetch upstream 2>/dev/null
		popd > /dev/null
	done
}

function CheckoutTag {
	local SOURCE_DIR
	local TAG="$1"

	for ((i=0; i < NSOURCES; i++)); do
		SOURCE_DIR=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 2 -d ':')
		ORIGIN_REPO=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 4 -d ':')

		pushd ${SOURCE_DIR} > /dev/null
			echo "Checkout ${TAG} in repo ${SOURCE_DIR}"
			git checkout $TAG 2>/dev/null
		popd > /dev/null
	done

}

# prepare processing
SOURCE_INFO_PROCESSED=($(echo "$SOURCE_INFO"))
NSOURCES=${#SOURCE_INFO_PROCESSED[*]}

[ $# -eq 0 ] && Usage
while getopts ":hsc:" opt; do
	case $opt in
		c) # Checkout tag
			echo "Checkout tag: ${OPTARG}"
			CheckoutTag $OPTARG
			;;
		s) # Sync fork 
			SyncFork
			;;
		h | *)
			Usage
			;;
	esac
done



#for ((i=0; i < NSOURCES; i++)); do
#        OPT=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 1 -d ':')
#        WHAT=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 2 -d ':')
#        UPSTREAM_REPO=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 3 -d ':')
#        ORIGIN_REPO=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 4 -d ':')
#        TAG=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 5 -d ':')
#        DNLOAD=$(echo "${SOURCE_INFO_PROCESSED[i]}" | cut -f 6 -d ':')
#
#		SyncFork "$WHAT" "git://nv-tegra.nvidia.com/${UPSTREAM_REPO}"	
#
#done

