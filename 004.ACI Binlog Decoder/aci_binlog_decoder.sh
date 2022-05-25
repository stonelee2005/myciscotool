#!/bin/sh
# Program : ACI_BINLOG_DECODER.sh 
# Author  : Guangxiong Li(guangli2@cisco.com/comebackhome@163.com)
# Date    : 2022-05-11
# Description :
#         This program is used to decode binlogfile to text file
#
# Usage   : 
#           ~./aci_binlog_decoder.sh <keyword> <SR> <nodeid> 
#            
# Example : 
#            ./aci_binlog_decoder.sh epm 693420742 2202
#
# Test command for  :
#           cp test/binlog_uuid_472_epmc_vdc_1_sub_1_level_3.old* .
#           cp test/binlog_uuid_410_epm_vdc_1_sub_1_level_3.old* .
#           rm -rf binlog_uuid_472_epmc_vdc_1_sub_1_level_3.old*
#           rm -rf binlog_uuid_410_epm_vdc_1_sub_1_level_3.old*
#
# -------------------------      Change Log      -------------------------
#
# Date           Author    Change Content
# ----------   --------   ----------------------------------------------------------------
# 2022-05-13    guangli2  New Version
# 2022-05-17    guangli2  modify error meassge
# 2022-05-23    guangli2  delele decode/dbgexp_tsod*3of3/ dir,because download dir change

gzfiles=$1
srId=$2
nodeId=$3
starttime=`date +%H:%M:%S` 
srFullName=""

[ "$1" = "epm" ] && gzfiles="epm_"

#echo "$gzfiles $srId $nodeId\n"
##------------------------------------------------------------------##
#  1. Validation
#  1.1 check if input params
if [ -z $gzfiles -o -z $srId -o -z $nodeId ] ; then
   echo "Usage   : aci_binlog_decoder.sh <keyword> <SR> <nodeid> "
   echo "Example : aci_binlog_decoder.sh epm 693420742 2202 "
   exit 2
fi

srFullName=`pwd`/dnld_${srId}
nodeFullName=${srFullName}/node-${nodeId}

if [ ! -d ${srFullName} ] ;then
   echo "================ Error Messege Start ================"
   echo ""
   echo "Directory [\033[1;41m${srFullName}\033[0m] is not exist,check the directory."
   echo "Check If [\033[1;41m${srFullName}\033[0m] is exist,Please input Correct [\033[1;41mSR Number\033[0m] ."
   echo ""
   echo "================ Error Messege End ================"
   echo ""

   exit 2   
fi


if [ ! -d ${nodeFullName} ] ;then
   echo "================ Error Messege Start ================"
   echo ""
   echo "Directory [\033[1;41m${nodeFullName}\033[0m] is not exist,check the directory."
   echo "Check If [\033[1;41m${nodeFullName}\033[0m] is exist,Please input Correct [\033[1;41mnode Number\033[0m] ."
   echo ""
   echo "================ Error Messege End ================"
   echo ""

   exit 2
fi 


decodeDir=~/${srId}_node-${nodeId}_$1

if [ -d $decodeDir ] ;then
   echo "\n"
   echo "================ Error Messege Start ================"
   echo ""
   echo "Directory[ ${decodeDir} ] is exist,check the directory."
   echo "If don't use the dir,please delete the dir using below commands."
   echo "\033[1;41mrm -rf ${decodeDir}\033[0m\n"
   echo "================ Error Messege End ================"
   echo ""
   exit 2

else
   mkdir $decodeDir
fi

#####################################################################
#                   2. Validation                                   #
#####################################################################
echo "\n\n"
echo "=========================================================================="
echo "*          KR_TAC AUTOMATION TOOL : ACI_BINLOG_DECODER RUNNING INFO      *"
echo "==========================================================================\n"

# 2022-05-23 delete /decode/dbgexp_tsod*3of3
#cd ${nodeFullName}/decode/dbgexp_tsod*3of3
cd ${nodeFullName}
srPwd=`pwd`
##------------------------------------------------------------------##

echo "1/3. nxos_binlog_decode IS COPIED. "
cp -af nxos_binlog_decode .

echo "2/3. GUNZIP $1*.gz FILES. "

for gzfile in `ls -vr ${srPwd}/var/sysmgr/tmp_logs/old/*${gzfiles}*.gz`;do
    gunzip $gzfile
done

echo "3/3. CREATE DECODED $1 FILES. "

#
#####################################################################
#                   3. Decode binlog                                #
#                                                                   #
#####################################################################

for file in `ls -vlr ${srPwd}/var/sysmgr/tmp_logs/old/*${gzfiles}* | grep ^[^d] | awk '{print $9}'`;do
    fileBasename=`basename $file`      
    filename=${decodeDir}/${fileBasename}

    ./nxos_binlog_decode $file > ${filename}

    startTime=`head -n3 $filename | tail -n1 | grep -o [2][0][2].*[0][0] | cut -c1-35`
    endTime=`tail -n1 $filename | grep -o [2][0][2].*[0][0] | cut -c1-35`
#    echo " startTime is ${startTime} ,endTime is ${endTime} "
#    echo ${filename}_${startTime}_${endTime}.txt 
    mv ${filename} ${filename}_${startTime}_${endTime}.txt
    echo "   * ${filename}_${startTime}_${endTime}.txt "
done

currentFile=`ls ${srPwd}/var/sysmgr/tmp_logs/*${gzfiles}*level_3`
curfileBasename=`basename $currentFile`
curfilename=${decodeDir}/${curfileBasename}
./nxos_binlog_decode $currentFile > ${curfilename}

startTime=`head -n3 $curfilename | tail -n1 | grep -o [2][0][2].*[0][0] | cut -c1-35`
endTime=`tail -n1 $curfilename | grep -o [2][0][2].*[0][0] | cut -c1-35`
#echo " startTime is ${startTime} ,endTime is ${endTime} "
#echo ${currentFile}_${startTime}_${endTime}.txt 
mv ${curfilename} ${curfilename}_CURRENT_${startTime}_${endTime}.txt

echo "   * ${curfilename}_CURRENT_${startTime}_${endTime}.txt "

echo ""
echo "=========================================================================="
echo ""
echo "            ACI_BINLOG_DECODER RUNTIME : ${starttime} ~ `date +%H:%M:%S`"
echo ""
echo "Please go to below ${decodeDir} to check logs."
echo "\033[1;41mcd ${decodeDir} ;ls -vrl\033[0m\n"
echo ""
echo "--------------------------------------------------------------------------"
echo "-                   Please feel free to contact me if you need help      -"
echo "-                   Developed & Maintained By StoneLi(guangli2@cisco.com)-"
echo "--------------------------------------------------------------------------"

