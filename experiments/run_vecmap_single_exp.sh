

l1=$1
l2=$2

VECMAP_ROOT="vecmap"
DICT_ROOT="../../filtered_dictionaries"
FASTTEXT_ROOT="../fasttext-vectors"

cd ${VECMAP_ROOT}

EXP_DIR=exp/${l1}-${l2}
# Will only run this experiment if it hasn't been ran before
if [ ! -f ${exp}/${l2}.mapped.emb ]
then
echo "Running experiment on: ", ${l1}, ${l2}
mkdir -p ${exp}
python3 map_embeddings.py --cuda --identical ${FASTTEXT_ROOT}/wiki.${l1}.vec ${FASTTEXT_ROOT}/wiki.${l2}.vec ${exp}/${l1}.mapped.emb ${exp}/${l2}.mapped.emb --batch_size 1000
fi

# Evaluate on both directions
python3 eval_translation.py  ${exp}/${l1}.mapped.emb ${exp}/${l2}.mapped.emb -d ${DICT_ROOT}/${l1}-${l2}.5000-6500.txt > ${exp}/eval.${l1}-${l2}.txt
python3 eval_translation.py  ${exp}/${l2}.mapped.emb ${exp}/${l1}.mapped.emb -d ${DICT_ROOT}/${l2}-${l1}.5000-6500.txt > ${exp}/eval.${l2}-${l1}.txt

cd ../

