sed -e 's/^[ \t]*//' -e 's/[[:space:]]*$//' < input/asm/$1 | gawk -F '[ \t,]*' -f scripts/asm.awk  > input/machinecode.inc
cat input/machinecode.inc
