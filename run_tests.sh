make
rm test/*.ref.s -f
rm test/*.our.s -f
mv test/*.cl .
FILES="*.cl"
# FILES="arith_custom.cl"
# FILES="simple_staticdispatch*.cl"
for f in $FILES
do
  echo "reference codegen: $f..."
  /usr/class/cs143/bin/coolc $f
  mv *.s test/$f.ref.s
  echo "our codegen: $f..."
  ./mycoolc $f
  mv *.s test/$f.our.s
done
mv *.cl test/