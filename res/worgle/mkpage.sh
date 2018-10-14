#!/bin/sh
if [ "$#" -eq 0 ]
then
    echo "Usage: $0 file.org"
    exit 1
fi
NAME=${1%.*}
NAME_TOC="$NAME""_toc"
cat > $NAME.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>$NAME</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>
<div id="main">
EOF

sorg -s $1 >> $NAME.html

cat >> $NAME.html <<EOF
</div>
</body>
</html>
EOF
cat > $NAME_TOC.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<title>$NAME</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>
<div id="main">
EOF

sorg -t $NAME.html -s $1 >> $NAME_TOC.html

cat >> $NAME_TOC.html <<EOF
</div>
</body>
</html>
EOF
