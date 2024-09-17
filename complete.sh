#!/bin/sh

# Script to complete the Doom3BFA (with flashlight) cycle
# First we ask the user which version of we want to build
# Default choice is RELEASE 
# of interest could be RETAIL (includes C++-11 standard) or DEBUG 



echo "Please enter the type of build you want: \n"
echo "Choices are:  \n"
echo "1. RELEASE (picked by default) \n"
echo "2. DEBUG \n"
echo "3. RETAIL \n"
echo "For release and debug without intrinsic functions (no simd) please calll the scripts directly \n"

read -p "Enter choice [i.e DEBUG or 2] or press enter for RELEASE " TYPE 

read -p "Enter choice [i.e a,B,%,22] to STOP after copy or press enter to start game " PLAY 


echo "Calling cmake-script for $TYPE"

case "TYPE" in
    "3" | "RETAIL" )
        sh neo/cmake-linux-retail.sh 
        cd build ;;
	"2" | "DEBUG" )
        sh neo/cmake-linux-debug.sh
        cd buildDb ;;
    * )
		sh neo/cmake-linux-release.sh  
        cd build ;;
esac
 

make -j17
cd ../ 

echo "\n Now we need to copy the files to our Doom3-BFG directory \n"
sleep 3 

cp -va base/* test_D3BFG/base/
cp -v build/DoomBFA test_D3BFG/DoomBFA

if [ -z ${PLAY} ]; then 
    cd test_D3BFG/ && ./DoomBFA;  
else
  echo "Stoping script here"
fi
	


