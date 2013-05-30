rm test/*.s.ref -f
rm test/*.s.our -f
mv test/*.cl .
# FILES="*.cl"
FILES="hello_world.cl"
for f in $FILES
do
  /usr/class/cs143/bin/coolc $f
  mv *.s test/$f.s.ref
  ./mycoolc $f
  mv *.s test/$f.s.our
done
mv *.cl test/