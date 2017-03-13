#! /bin/sh -x
for png in large/*.png
do
    small=small/$(basename $png)
    convert -resize %25 $png $small
done
