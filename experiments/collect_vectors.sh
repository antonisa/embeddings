
mkdir -p fasttext-vectors
cd fasttext-vectors
for l in "$@"
do
	echo "Downloading ${l} vectors"
	curl -Lo wiki.$l.vec.gz https://dl.fbaipublicfiles.com/fasttext/vectors-crawl/cc.$l.300.vec.gz
	gunzip wiki.$l.vec.gz
done
cd ../



