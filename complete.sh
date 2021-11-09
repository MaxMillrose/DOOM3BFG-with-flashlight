#!/bin/sh

# Script to complete the Doom3BFA (with flashlight) cycle
# First we ask the user which version of we want to build
# Default choice is RELEASE 
# of interest could be RETAIL (includes C++-11 standard) or DEBUG 

TYPE=3



echo $TYPE
echo "Please enter the type of build you want: \n"
echo "Choices are:  \n"
echo "1. RETAIL \n"
echo "2. DEBUG \n"
echo "3. RELEASE \n"
echo "For release and debug without intrinsic functions (no simd) please calll the scripts directly \n"

read -p "Enter choice [i.e DEBUG or 2] or press enter for RELEASE " TYPE 

echo "Calling cmake-script for $TYPE"

case "TYPE" in
    "1" | "RETAIL" )
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

echo "Now we need to copy the files to our Doom3-BFG directory"
echo "End line"
	


