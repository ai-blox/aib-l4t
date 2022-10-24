# aib-l4t repo

This is the AI-BLOX fork of the NVIDIA L4T repos and contains all the modifications necessary to run L4T on the AI-BLOX hardware.


## How to clone?

You can clone the repo with following commands.

````shell
$ git clone git@github.com:ai-blox/aib-l4t.git
$ cd aib-l4t
$ git submodule init
$ git submodule update

````

## JetPack versions

Depending of the JetPack version, you need to checkout the correct branch. 
The table below shows the JetPack version versus the L4T branch

| JetPack version | Branch          |
|-----------------|-----------------|
| JetPack 4.6.1   | aib-l4t-r32.7.1 |
| JetPack 4.6     | aib-l4t-r32.6.1 |
| JetPack 4.5.1   | aib-l4t-r32.5.1 |
| JetPack 4.5     | aib-l4t-r32.5   |
| JetPack 4.4.1   | aib-l4t-r32.4.4 |
| JetPack 4.4     | aib-l4t-r32.4.3 |
| JetPack 4.4 DP  | aib-l4t-r32.4.2 |

### Checkout the right version

If you want to build L4T for examplefor JetPack version 4.4, you need to checkout aib-l4t-r32.4.3.

````shell
$ git remote foreach 'git checkout aib-l4t-r32.4.3'

````


## Repos overview

| directory                                      | ai-blox repo                                                                                              | nvidia repo                                                                                           |
|------------------------------------------------|-----------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| kernel/kernel-4.9                              | [kernel-4.9](https://github.com/ai-blox/l4t-kernel-kernel-4.9)                                            | git://nv-tegra.nvidia.com/linux-4.9.git                                                               |
| kernel/nvgpu                                   | [nvgpu](https://github.com/ai-blox/l4t-kernel-nvgpu)                                                      | git://nv-tegra.nvidia.com/linux-nvgpu.git                                                             |
| kernel/nvidia                                  | [nvidia](https://github.com/ai-blox/l4t-kernel-nvidia)                                                    | git://nv-tegra.nvidia.com/linux-nvidia.git                                                            |                                                                                                  |
| hardware/nvidia/soc/t18x                       | [soc/t18x](https://github.com/ai-blox/l4t-hardware-nvidia-soc-t18x)                                       | git://nv-tegra.nvidia.com/device/hardware/nvidia/soc/t18x.git                                         |                                                                   |
| hardware/nvidia/platform/tegra/common          | [tegra/common](https://github.com/ai-blox/l4t-hardware-nvidia-platform-tegra-common)                      | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/tegra/common.git                            | 
| hardware/nvidia/platform/t18x/common           | [t18x/common](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t18x-common)                        | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t18x/common.git                             |
| hardware/nvidia/platform/t18x/quill            | [t18x/quill](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t18x-quill)                          | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t18x/quill.git                              |
| hardware/nvidia/soc/t210                       | [soc/t210](https://github.com/ai-blox/l4t-hardware-nvidia-soc-t210)                                       | git://nv-tegra.nvidia.com/device/hardware/nvidia/soc/t210.git                                         |
| hardware/nvidia/platform/t210/common           | [t210/common](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t210-common)                        | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t210/common.git                             |
| hardware/nvidia/platform/t210/jetson           | [t210/jetson](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t210-jetson)                        | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t210/jetson.git                             |
| hardware/nvidia/platform/t210/porg             | [t210/porg](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t210-porg)                            | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t210/porg.git                               |
| hardware/nvidia/soc/t19x                       | [soc/t19x](https://github.com/ai-blox/l4t-hardware-nvidia-soc-t19x)                                       | git://nv-tegra.nvidia.com/device/hardware/nvidia/soc/t19x.git                                         |
| hardware/nvidia/platform/t19x/common           | [t19x/common](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t19x-common)                        | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t19x/common.git                             |
| hardware/nvidia/platform/t19x/galen/kernel-dts | [t19x/galen/kernel-dts](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t19x-galen-kernel-dts)    | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t19x/stardust-dts.git                       |
| hardware/nvidia/platform/t19x/jakku/kernel-dts | [t19x/jakku/kernel-dts](https://github.com/ai-blox/l4t-hardware-nvidia-platform-t19x-jakku-kernel-dts)    | git://nv-tegra.nvidia.com/device/hardware/nvidia/platform/t19x/jakku-dts.git                          |
| hardware/nvidia/soc/tegra                      | [soc/tegra](https://github.com/ai-blox/l4t-hardware-nvidia-soc-tegra)                                     | git://nv-tegra.nvidia.com/device/hardware/nvidia/soc/tegra.git                                        |
| u-boot                                         | [u-boot](https://github.com/ai-blox/l4t-u-boot)                                                           | git://nv-tegra.nvidia.com/device/hardware/nvidia/soc/tegra.git                                        |
 