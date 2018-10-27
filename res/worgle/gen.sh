# Generate org maps, remove source code
worgle -m worgle_map.org worgle.org
rm -f worgle.c
worgle -m sorg_map.org sorg.org
rm -f sorg.c

# Generate pages

./mkpage.sh sorg.org
./mkpage.sh worgle.org
./mkpage.sh worgle_map.org
./mkpage.sh sorg_map.org
