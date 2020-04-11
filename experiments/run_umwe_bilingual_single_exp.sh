
UMWE_ROOT="umwe"
DICT_ROOT="../../filtered_dictionaries"
FASTTEXT_ROOT="../fasttext-vectors"

cd ${UMWE_ROOT}
# First align using source
src=$1
tgt=$2
exst=${src}${tgt}

hub=$3

# Unless we only want to use the source as the hub...
if [ "${hub}" != "source" ]
then
	# ... we will align the source to the target using the target as the hub
	# Experiment name: [lang1][lang2]-[hub]: e.g. enfr-en means that en was the hub language
	EXP=experiments/${exst}-${tgt}

	cd ${UMWE_ROOT}
	mkdir -p ${EXP}

	python3 supervised.py --src_langs ${src}  --tgt_lang ${tgt} --dico_train identical_char  --exp_name tgt_${tgt} --exp_path ${EXP} --export pth
	# Required to retrieve the random experiment id created by the above command
	id=`ls ${EXP}/tgt_${tgt}/`
	python3 evaluate.py --src_langs ${src} --tgt_lang ${tgt} --eval_pairs all --exp_name tgt_${tgt} --exp_path ${EXP} --exp_id ${id}
fi


# Unless we only want to use the target as the hub...
if [ "$hub" != "target" ]
then
	# ... we will align the source to the target using the source as the hub
	src=$2
	tgt=$1
	# Experiment name: [lang1][lang2]-[hub]: e.g. enfr-en means that en was the hub language
	EXP=experiments/${exst}-${tgt}


	cd ${UMWE_ROOT}
	mkdir -p ${EXP}

	python3 supervised.py --src_langs ${src}  --tgt_lang ${tgt} --dico_train identical_char  --exp_name tgt_${tgt} --exp_path ${EXP} --export pth
	# Required to retrieve the random experiment id created by the above command
	id=`ls ${EXP}/tgt_${tgt}/`
	python3 evaluate.py --src_langs ${src} --tgt_lang ${tgt} --eval_pairs all --exp_name tgt_${tgt} --exp_path ${EXP} --exp_id ${id}

fi


cd ../



