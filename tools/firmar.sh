#!/bin/bash
#
# Firma ficheros para instalar en el dispositivo. 
#

. mensajes.sh

OUT_TARGET_HOST=linux-x86
SECURITYDIR=$ANDROID_BUILD_TOP/build/target/product/security

msgStatus "Firmando el fichero $1"
	
java -Xmx1000m \
  -jar $ANDROID_BUILD_TOP/out/host/$OUT_TARGET_HOST/framework/signapk.jar \
  -w $SECURITYDIR/testkey.x509.pem $SECURITYDIR/testkey.pk8 \
  $1 $2
if [ "$?" -ne 0 ]; then
    msgErr "Error al firmar el fichero $1"
    exit 1
fi

# Crear md5 para el paquete firmado

img=`basename $2`
cd `dirname $2`
md5sum $img > $img.md5sum
msgOK "Paquete creado: $2"
msgOK `cat $img.md5sum`

exit 0
