#!/bin/bash
cd $1

# No queremos ejecutar este script al incio de la ROM.
#rm $1/system/bin/fix_permissions

cd system
sed -i -e "s/ro.product.device=morrison/ro.product.device=morr/" build.prop
