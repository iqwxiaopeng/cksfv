#!/bin/sh

cksfv="../src/cksfv"

# test case 1
$cksfv -f c1.sfv &> /dev/null
if test "$?" != "0" ; then
    echo "test case 1 unsuccesful. should report correct checksum."
    exit -1
fi
echo test case 1 succesful

# test case 2
$cksfv -f c2.sfv &> /dev/null
if test "$?" = "0" ; then
    echo "test case 2 unsuccesful. should report incorrect checksum."
    exit -1
fi
echo test case 2 succesful

# test case 3
$cksfv a b c > tmp.sfv 2> /dev/null
if test "$?" != "0" ; then
    echo "test case 3 unsuccesful. sfv creation failed."
    exit -1
fi
$cksfv -f tmp.sfv &> /dev/null
if test "$?" != "0" ; then
    echo "test case 3 unsuccesful. sfv checking failed."
    exit -1
fi
echo test case 3 succesful

# test case 4
$cksfv a d &> /dev/null
if test "$?" == "0" ; then
    echo "test case 3 unsuccesful. sfv creation should have failed."
    exit -1
fi
echo test case 4 succesful

# test case 5
$cksfv -i -f c3.sfv &> /dev/null
if test "$?" != "0" ; then
    echo "test case 1 unsuccesful. in-casesensitive checking failed."
    exit -1
fi
echo test case 5 succesful