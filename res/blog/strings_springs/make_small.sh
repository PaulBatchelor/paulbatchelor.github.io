for i in large/*.jpg
do
    echo $i
    filename=$(basename $i)
    convert -resize %50 $i small/$filename
done
