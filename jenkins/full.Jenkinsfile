node('jenkins-ec2-plugin-slave') {

}

pipeline {
	agent any
/*
	agent {
        dockerfile {
            dir 'jenkins'
            filename 'full.Dockerfile'
            additionalBuildArgs """ --build-arg TAG=r32.7.1 \
                                    --build-arg TEGRA_KERNEL_OUT=ai-blox_sdk/aib-l4t-r32.7.1 \
                                    --build-arg LOCALVERSION=-tegra"""
        }
	} */
	stages {
        stage('Build Kernel') {
            steps {
                sh '''#!/bin/bash -ex

                    git submodule foreach 'git checkout aib-l4t-r32.7.1'
                    cd kernel/kernel-4.9
                    export TEGRA_KERNEL_OUT=~/nvidia/ai-blox_sdk/aib-l4t-r32.7.1
                    export LOCALVERSION=-tegra
                    mkdir -p $TEGRA_KERNEL_OUT
                    make ARCH=arm64 O=$TEGRA_KERNEL_OUT tegra_defconfig

	                //#  add the EDT FocalTech FT5x06 I2C Touchscreen support driver through menuconfg
	                //# TOUCHSCREEN_EDT_FT5X06
	                //$ make ARCH=arm64 O=$TEGRA_KERNEL_OUT menuconfig

	                //# build everything
	                make ARCH=arm64 O=$TEGRA_KERNEL_OUT -j6
                '''
            }
        }
	}
}