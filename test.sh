rm *.s.ref -f
rm *.s.our -f
FILES="./*.cl"
for f in $FILES
do
  /usr/class/cs143/bin/coolc $f
  mv *.s $f.s.ref
  ./mycoolc $f
  mv *.s $f.s.our
done