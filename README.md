# Dictionaries for better evaluation of Cross-Lingual Embeddings

Despite a broad move towards (massively) multilingual systems, most of work on Bilingual Lexicon Induction has focused on English-centric evaluation. 
Here we provide dictionaries between 49 languages (2353 directional pairs) in order to facilitate research and evaluation on more diverse language pairs.

The data were created for our work on "[Should All Cross-Lingual Embeddings Speak English?](https://arxiv.org/pdf/1911.03058.pdf)".

## The Dictionaries

Each line of the dictionaries contains 6 columns:
`<source_word>    <target_word>    <source_lemma>    <target_lemma>    <source_analysis>    <target_analysis>`.
Here's an example from the Catalan-Italian dictionary:
~~~
forçar	costringere	forçar	costringere	V;NFIN	V;NFIN
forçar	forzare	forçar	forzare	V;NFIN	V;NFIN
forçar	costringendo	forçar	costringere	V;NFIN	V;V.MSDR
discorre	corre	discorre	correre	V;IND;SG;3;PRS;FIN	V;IND;SG;3;PRS;FIN
magatzem	magazzino	magatzem	magazzino	N;MASC;SG	N;MASC;SG
targeta	card	targeta	card	N;FEM;SG	N;FEM
...
~~~

We created new dictionaries for a few language pairs (aze-eng, bel-eng, glg-eng), utilizing aligned parallel data.
We then triangulated all of the [MUSE dictionaries](https://github.com/facebookresearch/MUSE) through English.
The last step involves aggressive filtering, based on part-of-speech tagging and morphological analysis (using the [stanfordnlp](https://github.com/stanfordnlp/stanfordnlp) package):

* Following [Kementchedjhieva et al, 2019](https://arxiv.org/abs/1909.05708) we removed all pairs including proper nouns or tagged as foreign.
* In order to account for morphological variants, we removed triangulated entries with mismatched morphological analyses (except for grammatical gender; see paper for details).<sup id="a1">[1](#f1)</sup>

The `filtered_dictionaries` directory contains the final filtered dictionaries. (<-- Use this for evaluation!)
The `rejected_entries` directory contains the entries that were rejected due to filtering.
The `bridged_dictionaries` directory contains the original triangulated dictionaries.

## Languages

Our dictionaries cover the following languages: afr, ara, aze, bel, bul, ben, bos, cat, ces, dan, deu, ell, eng, spa, est, fas, fin, fra, glg, heb, hin, hrv, hun, ind, ita, jpn, kor, lit, lav, mkd, msa, nld, nob, pol, por, ron, roc, rus, slk, slv, sqi, swe, tam, tha, tel, tur, ukr, urd, vie.

Note: the dictionaries for the following languages have not been filtered, as they are currently not supported by stanfordnlp: aze, bel, ben, bos, lit, mkd, msa, sqi, tam, tha, tel. Use the `bridged_dictionaries` for these languages.

## How to replicate the experiments in our paper

Follow the instructions in the README of the `experiments` directory.

## How to cite
The data were created for our work on "[Should All Cross-Lingual Embeddings Speak English?](https://arxiv.org/pdf/1911.03058.pdf)". You can cite it as:
~~~
@misc{anastasopoulos19embeddings,
    title = {Should All Cross-Lingual Embeddings Speak English?},
    author = {Antonios Anastasopoulos and Graham Neubig},
    year = {2019},
    note = {{arXiv}:1911.03058}
}
~~~

<b id="f1">1</b>: A related work with additional complete dictionaries is [Czarnowska et al, 2019](https://www.aclweb.org/anthology/D19-1090/). [↩](#a1)
