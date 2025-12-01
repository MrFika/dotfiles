#!/bin/bash

function unzip_output {
    zip="$2.zip"
    mv "$1" "$zip"
    unzip $zip -d $2
    cd $2
}
function rename_bundle {
    mv "bws_internal-test-bundle.bin" "$1"
}
function custom_bundle {
    bundle_name=$1
    custom_fimage=$2
    workdir_bundle_name="tmp_custom_bundle"
    # Change BWS to lower case.
    bws_bundle=$(echo $bundle_name | tr '[:upper:]' '[:lower:]')
    # Remove .bin suffix.
    bws_bundle=$(echo $bws_bundle | sed -e "s/.bin//")
    # remove the internal-test_ part from the internal folder as it should not be there.
    bws_bundle=$(echo $bws_bundle | sed -e "s/internal-test_//")
    echo "BWS BUNDLE: $bws_bundle"
    echo "Unzip bundle"
    unzip $bundle_name -d $workdir_bundle_name
    echo "Delete W120 fimage."
    rm $workdir_bundle_name/$bws_bundle/W120_*
    echo "Insert custom W120 fimage."
    cp $custom_fimage $workdir_bundle_name/$bws_bundle/$custom_fimage
    echo "Zip up bundle."
    cd $workdir_bundle_name
    zip custom_$bundle_name -r $bws_bundle/
    mv custom_$bundle_name ../custom_$bundle_name
    popd
    rm -r $workdir_bundle_name
}

function custom_bundle_generic {
    bundle_name=$1
    custom_fimage=$2
    product_name=$(echo "$2" | cut -c 1-5)  # W120_  W800_
    workdir_bundle_name="tmp_custom_bundle"
    # Change BWS to lower case.
    bws_bundle=$(echo $bundle_name | tr '[:upper:]' '[:lower:]')
    # Remove .bin suffix.
    bws_bundle=$(echo $bws_bundle | sed -e "s/.bin//")
    # remove the internal-test_ part from the internal folder as it should not be there.
    bws_bundle=$(echo $bws_bundle | sed -e "s/internal-test_//")
    echo "BWS BUNDLE: $bws_bundle"
    echo "Unzip bundle"
    unzip $bundle_name -d $workdir_bundle_name
    echo "Delete fimage."
    rm $workdir_bundle_name/$bws_bundle/$product_name*
    echo "Insert custom fimage."
    cp $custom_fimage $workdir_bundle_name/$bws_bundle/$custom_fimage
    echo "Zip up bundle."
    cd $workdir_bundle_name
    zip custom_$bundle_name -r $bws_bundle/
    mv custom_$bundle_name ../custom_$bundle_name
    popd
    rm -r $workdir_bundle_name
}

### Jenkins Helper funcs ###
function get_rootfs_from_jenkins() {
    filename="W120$( echo $1 | tr / _ )_$2_$3"
    ssh -p 29420 jenkins04.labnet.rnd.axis.com get-artifact $1 $2 $3 > $filename
}
function get_file_from_jenkins() {
    ssh -p 29420 jenkins04.labnet.rnd.axis.com get-artifact $1 $2 $3 > $3
}

### Jenkins  get rootfs ###
function get_rootfs_from_jenkins_kirk() {
    get_rootfs_from_jenkins "/Teams/XVP_PROJECTS/KIRK/QA/W120-Products/W120_Build" $1 "rootfs.tar.gz"
}

### Jenkins output unzips ###
function unzip_kirk_jenkins {
    get_file_from_jenkins "/Teams/XVP_PROJECTS/KIRK/QA/W120-Products/BWS-W120_FuncTest" $1 "output.zip"
    unzip_output "output.zip" "kirk_w120_$1"
}
function unzip_kirk_jenkins_daily_master {
    get_file_from_jenkins "/Teams/XVP_PROJECTS/KIRK/QA/DailyMasterW120-Products/BWS-W120_FuncTest" $1 "output.zip"
    unzip_output "output.zip" "kirk_w120_daily_master_$1"
}
function unzip_kirk_jenkins_daily_active {
    get_file_from_jenkins "/Teams/XVP_PROJECTS/KIRK/QA/DailyActiveW120-Products/BWS-W120_FuncTest" $1 "output.zip"
    unzip_output "output.zip" "kirk_w120_daily_active_$1"
}
function unzip_kirk_jenkins_daily_streaming {
    get_file_from_jenkins "/Teams/XVP_PROJECTS/KIRK/QA/DailyStreamingW120-Products/BWS-W120_FuncTest" $1 "output.zip"
    unzip_output "output.zip" "kirk_w120_daily_streaming_$1"
}

### SSH SETUP STUFF ###
function setup_ssh_bw() {
    echo "Setup ssh."
    if [[ -z "$DUT_1_IP_ADDR" ]]
    then
        echo -e "DUT_1_IP_ADDR not set."
    elif [[ -z "$BWC" ]]
    then
        echo "BWC not set."
    else
        echo "Uploading ssh-key to $DUT_1_IP_ADDR"
        ssh-copy-id root@$DUT_1_IP_ADDR
        if [[ $? -eq 1 ]]; then  # If an old key already exists try to delete it and run again.
            ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "$DUT_1_IP_ADDR"
            ssh-copy-id root@$DUT_1_IP_ADDR
        fi
        echo "Uploading ssh-key to $BWC"
        ssh-copy-id -o ProxyJump=root@$DUT_1_IP_ADDR root@$BWC%br0
        if [[ $? -eq 1 ]]; then
            ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "$BWC%br0"
            ssh-copy-id -o ProxyJump=root@$DUT_1_IP_ADDR root@$BWC%br0
        fi
        echo "Setting up ssh connection."
        ssh -J root@$DUT_1_IP_ADDR root@$BWC%br0
    fi
}

function ssh_connect_to() {
    echo "Uploading ssh-key to $1"
    ssh-copy-id root@$1
    if [[ $? -eq 1 ]]; then  # If an old key already exists try to delete it and run again.
        ssh-keygen -f "/home/$USER/.ssh/known_hosts" -R "$1"
        ssh-copy-id root@$1
    fi
    ssh root@$1
}


ssh_labnet_kirk_bws_1() {
    DUT_1_IP_ADDR=kirk-bws-w120-1.labnet.rnd.axis.com BWC=fe80::baa4:4fff:fea2:6502 setup_ssh_bw
}
ssh_labnet_kirk_bws_2() {
    DUT_1_IP_ADDR=kirk-bws-w120-2.labnet.rnd.axis.com BWC=fe80::baa4:4fff:fea2:5df6 setup_ssh_bw
}
ssh_labnet_kirk_bws_3() {
    DUT_1_IP_ADDR=kirk-bws-w120-3.labnet.rnd.axis.com BWC=fe80::baa4:4fff:fea2:5df6 setup_ssh_bw
}


### Setup workspaces

setup_workspace() {
    tmuxinator start bodyworn &
    wait $!
    tmuxinator start dotfiles &
    wait $!
    tmuxinator start tart &
    wait $!
    tmuxinator start qart &
    wait $!
    tmuxinator start sart &
    wait $!
    tmuxinator start qast &
    wait $!
    tmuxinator start xcam-memlog &
    wait $!
    tmuxinator start stabtest &
    wait $!
    ta bodyworn
}
