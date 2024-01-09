node('jenkins-ec2-plugin-slave') {

}

pipeline {
	agent {
        dockerfile {
            dir 'jenkins'
            filename 'full.Dockerfile'
            additionalBuildArgs """ --build-arg TAG=r32.7.1 """
        }
	}
	stages {
        stage('Build Kernel') {
            steps {
                sh 'git submodule foreach "git checkout aib-l4t-r32.7.1"'
                sh 'cd kernel/kernel-4.9'
                sh 'export TEGRA_KERNEL_OUT=~/nvidia/ai-blox_sdk/aib-l4t-r32.7.1'
                sh 'export LOCALVERSION=-tegra'
                sh 'mkdir -p $TEGRA_KERNEL_OUT'
                sh 'make O=$TEGRA_KERNEL_OUT tegra_defconfig'

                //#  add the EDT FocalTech FT5x06 I2C Touchscreen support driver through menuconfg
                //# TOUCHSCREEN_EDT_FT5X06
                //$ make ARCH=arm64 O=$TEGRA_KERNEL_OUT menuconfig

                //# build everything
                sh 'make O=$TEGRA_KERNEL_OUT -j6'
            }
        }
	}
}