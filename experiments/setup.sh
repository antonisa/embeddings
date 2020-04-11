

# Download umwe
git clone https://github.com/ccsasuke/umwe.git
cd umwe
mkdir -p data/crosslingual
ln -s ../../filtered_dictionaries data/crosslingual/dictionaries
# The above is needed because the evaluation script of umwe expects to find the dictionaries in the umwe/data/crosslingual/dictionaries folder
cd ../

# Download vecmap
git clone https://github.com/artetxem/vecmap.git

# Download MUSE
git clone https://github.com/facebookresearch/MUSE.git

