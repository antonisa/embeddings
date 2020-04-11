

for l1 in $@
do
for l2 in $@
do
if [ "$l1" != "$l2" ]
then
	bash run_vecmap_single_exp.sh ${l1} ${l2}
fi
done
done


