
# Replicating our experiments
You can follow the following steps in order to replicate all the experiments from our paper

## Requirements
Our code relies on three embedding mapping libraries, which have the following requirements:
* Python 3.6 or higher
* [NumPy](http://www.numpy.org/)
* [SciPy](https://www.scipy.org/)
* [CuPy](https://github.com/cupy/cupy) (optional, only required for CUDA support with VecMap)
* [Faiss](https://github.com/facebookresearch/faiss) (optional but highly recommended for fast nearest neighbor search (CPU or GPU). It can be installed using "conda install faiss-cpu -c pytorch" or "conda install faiss-gpu -c pytorch".

## Setup
This step will download (clone) the MUSE, VecMap, and UMWE libraries.
~~~
bash setup.sh
~~~
(If you already have any of these libraries, comment out the respective lines here.
The replication scripts assume that the libraries are under the current directory, so you'll need to change the pointer to their source if you already have them elsewhere)

You should now have three directories named `MUSE`, `vecmap`, and `umwe`.

## Downloading the original fasttext embeddings
Run ``collect_vectors.sh`` with a list of languages in order to download the fasttext vectors. 
(By default the scripts will assume that the original vectors are in the `fasttext-vectors` directory, so you'll need to change the pointer to their location if you already have them elsewhere)
Example run:
~~~
bash collect_vectors.sh en el fr
~~~

## Running Bilingual Experiments
For a given language pair, you can run MUSE, vecmap, and umwe experiments with the following, just providing the two languages:
~~~
bash run_vecmap_single_exp.sh af el
bash run_MUSE_single_exp.sh af el
bash run_umwe_bilingual_single_exp.sh af el both
~~~
The third argument for `run_umwe_bilingual_single_exp.sh` can be set to `source`,`target`, or `both`. This will define which of the two will be used as the hub language (if `both` then two experiments will be run).

We also provide helper scripts for running bilingual experiments between all languages for a list of languages. Example
~~~
bash run_vecmap_multiple.sh af el en es
bash run_MUSE_multiple.sh af el en es
bash run_umwe_bilingual_multiple.sh af el en es
~~~

## Running Multilingual Experiments
For a set of languages, you can run umwe with the following, providing the list of languages (the double quotes are important), the hub language, and the experiment name:
~~~
bash run_umwe_multilingual_single_exp.sh "en es pt" "gl" "exp1"
~~~

You can also run all the experiments for a set of languages, using each of them as a hub, providing a list and the experiment name:
~~~
bash run_umwe_multilingual_multiple.sh "es pt gl" "iberian"
~~~

## Evaluation Results
Each of the above scripts will also run evaluation over the dictionaries.
The results of the evaluation are stored under each model's experiment directories. The specific files will be under:

* (bilingual) MUSE: MUSE/dumped/[lang1]-[lang2]/eval1/train.log for source-target eval. Go to MUSE/dumped/[lang1]-[lang2]/eval2/train.log for target-source eval.
* (bilingual) vecmap: vecmap/exp/[lang1]-[lang2]/eval.[lang1]-[lang2].txt for source-target eval. Go to vecmap/exp/[lang1]-[lang2]/eval.[lang2]-[lang1].txt for target-source eval.
* bilingual UMWE: umwe/experiments/[experiment name]/tgt_[hub]/[random_id]/evaluate.log
* multilingual UMWE: umwe/experiments/[experiment name]/tgt_[hub]/[random_id]/evaluate.log

