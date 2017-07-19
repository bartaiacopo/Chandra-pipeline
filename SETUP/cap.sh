#!/bin/bash

#=========== Environment setup for XWSM (H. Bourdin; 05/06) =============

#------------- Setting IDL startup --------------------------------------

export IDL_STARTUP=$CAP_PATH/SETUP

#------------- Setting some secondary pathes ----------------------------

#export XWSM_PATH=$CAP_PATH/DATA_ANALYSIS/xmap_iac/xwsm
#export ATOMDB=$CAP_PATH/DATA_ANALYSIS/xmap_iac

#------------- Extending the global PATH --------------------------------

#export PATH=$PATH:$XWSM_PATH/bin
#os_name=`echo $OSTYPE | awk '{print substr($0,0,6)}'`
#if [ $os_name = "darwin" ]
#then
#    export PATH=$PATH:$CAP_PATH/mr_bin/darwin
#else
#    export PATH=$PATH:$CAP_PATH/mr_bin/linux
#fi
                                                                 
#------------- Setting the personal data directory ----------------------

#export CAP_DATA_PATH=$HOME/cap_data
#if test -d $CAP_DATA_PATH; then
#    dummy=0
#else
#    mkdir $CAP_DATA_PATH
#fi
#if test -d $CAP_DATA_PATH/general; then
#    dummy=0
#else
#    mkdir $CAP_DATA_PATH/general

#fi
#if test -d $CAP_DATA_PATH/tmp; then
#    dummy=0
#else
#    mkdir $CAP_DATA_PATH/tmp
#fi
#if test -d $CAP_DATA_PATH/scripts; then
#    dummy=0
#else
#    mkdir $CAP_DATA_PATH/scripts
#fi
#export CAP_SZDATA_PATH=$HOME/xmap_szdata

#------------------------------------------------------------------------
#alias xwsm_spec='$XMAP_PATH/idl_bin/bin/idl -vm='$XWSM_PATH/idl_vm/xwsm_spec_vm.sav''
#alias xwsm_spec='. $XWSM_PATH/idl_vm/xwsm_spec.sh'
#alias xwsm_start='. $XWSM_PATH/idl_vm/xwsm_start.sh'
#------------------------------------------------------------------------

##xmap_version=`. $CAP_PATH/xwsm/man/xmap_version.sh`
##echo ' Benvenuto in CAP' $xmap_version ', buon divertimento!'

#------------------------------------------------------------------------
