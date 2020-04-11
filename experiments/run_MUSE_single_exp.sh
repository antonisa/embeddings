

MUSE_ROOT="MUSE"
DICT_ROOT="../../filtered_dictionaries"
FASTTEXT_ROOT="../fasttext-vectors"

cd ${MUSE_ROOT}

src=$1
tgt=$2
id=s2t
dico=S2T
python3 supervised.py --src_lang ${src} --tgt_lang ${tgt} --src_emb ${FASTTEXT_ROOT}/wiki.${src}.vec --tgt_emb ${FASTTEXT_ROOT}/wiki.${tgt}.vec --n_refinement 5 --dico_train identical_char --export pth --dico_eval ${DICT_ROOT}/${src}-${tgt}.5000-6500.txt --exp_name $src$tgt --exp_id $id --dico_build $dico

# Evaluate on both directions
python3 evaluate.py --src_lang ${src} --tgt_lang ${tgt} --src_emb  dumped/${src}${tgt}/${id}/vectors-${src}.pth --tgt_emb dumped/${src}${tgt}/${id}/vectors-${tgt}.pth --max_vocab 200000 --dico_eval ${DICT_ROOT}/${src}-${tgt}.5000-6500.txt --exp_name ${src}${tgt} --exp_id eval_s2t
python3 evaluate.py --src_lang ${tgt} --tgt_lang ${src} --src_emb  dumped/${src}${tgt}/${id}/vectors-${tgt}.pth --tgt_emb dumped/${src}${tgt}/${id}/vectors-${src}.pth --max_vocab 200000 --dico_eval ${DICT_ROOT}/${tgt}-${src}.5000-6500.txt --exp_name ${src}${tgt} --exp_id eval_t2s

cd ../


