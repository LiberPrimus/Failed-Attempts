#!/bin/bash

dir=liber-primus__images--full

rm -f $dir/checksums.txt
for filename in $dir/*.jpg; do
    sha=`sha512sum $filename`
    filenum=`echo "$filename" | sed -e "s/^$dir//"`
    echo -n -e "$filenum SHA512:   $sha\n" >> $dir/checksums.txt
    blake=`b2sum $filename`
    echo -n -e "$filenum BLAKE2:   $blake\n\n\n" >> $dir/checksums.txt
done

cat $dir/checksums.txt
cat $dir/checksums.txt | grep 36367763ab73783c7af284446c59466b4cd653239a311cb7116d4618dee09a8425893dc7500b464fdaf1672d7bef5e891c6e2274568926a49fb4f45132c2a8b4

