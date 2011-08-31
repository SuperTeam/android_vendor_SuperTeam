#!/bin/bash
cd $1
# Eliminamos algunos apk's innecesarios
cd system
rm $1/system/app/Torch.apk
rm $1/system/etc/super/04superteam
