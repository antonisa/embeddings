
languages=$1
exp_id=$2

for hub in $languages
do
	# Remove the hub from the sources
	srcs=`printf '%s\n' "${languages//$hub/}"`
	echo "Experiment on: ", $srcs, " and hub: ", $hub
	bash  run_umwe_multilingual_single_exp.sh "${srcs}" ${hub} ${exp_id}
done


