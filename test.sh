rm example.ref.s -f
rm example.our.s -f
/usr/class/cs143/bin/coolc example.cl
mv example.s example.ref.s
./mycoolc example.cl
mv example.s example.our.s