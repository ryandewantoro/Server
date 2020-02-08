#!/bin/bash
 
# Bulan, tanya pada program date
BULAN_INI=`date +%B`
 
echo "Bulan: " $BULAN_INI
 
# Pencabangan pakai case
case $BULAN_INI in
  Ju??|'August'|'September')      # pilihan pertama
      echo "Musim kemarau"
      ;;                          # akhiri dengan dua titik koma
  'December'|*ry|'March')         # pilihan kedua
      echo "Musim hujan"
      ;;
  *)                              # pilihan sisa
      echo "Musim pancaroba"
      ;;
esac
