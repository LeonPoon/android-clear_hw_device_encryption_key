#!/bin/bash
PREFIX="$(dirname "$0")"
out=$PREFIX/../out/target/product/h990/system/bin/mymod
adb push $out /storage/self/primary/
echo 'run in adb shell as root:'
echo '  mv /storage/self/primary/mymod /data && chmod -v +x /data/mymod'
echo 'then run /data/mymod as root, and examine logcat for mymod messages.'
