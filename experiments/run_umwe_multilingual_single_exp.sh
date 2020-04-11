
UMWE_ROOT="umwe"
DICT_ROOT="../../filtered_dictionaries"
FASTTEXT_ROOT="../fasttext-vectors"


# First align using source
src=$1
tgt=$2
exst=$3

cd ${UMWE_ROOT}

# ... we will align the source to the target using the target as the hub
# Experiment name: [lang1][lang2]-[hub]: e.g. enfr-en means that en was the hub language
EXP=experiments/${exst}-${tgt}

cd ${UMWE_ROOT}
mkdir -p ${EXP}

python3 supervised.py --src_langs ${src}  --tgt_lang ${tgt} --dico_train identical_char  --exp_name tgt_${tgt} --exp_path ${EXP} --export pth
# Required to retrieve the random experiment id created by the above command
id=`ls ${EXP}/tgt_${tgt}/`
python3 evaluate.py --src_langs ${src} --tgt_lang ${tgt} --eval_pairs all --exp_name tgt_${tgt} --exp_path ${EXP} --exp_id ${id}

cd ../





