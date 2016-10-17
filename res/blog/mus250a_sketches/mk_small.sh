for p in *.png
do
    echo convert -resize 40% $p ${p%.png}_small.png
    convert -resize 40% $p ${p%.png}_small.png
done
