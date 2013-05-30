rm test/*.ref.s -f
rm test/*.our.s -f
mv test/*.cl .
# FILES="*.cl"
FILES="hello_world.cl"
for f in $FILES
do
  /usr/class/cs143/bin/coolc $f
  mv *.s test/$f.ref.s
  ./mycoolc $f
  mv *.s test/$f.our.s
done
mv *.cl test/