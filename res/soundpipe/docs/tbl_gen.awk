BEGIN {
print "<table style='border:none;'>";
print "<tr>"
print "<td><b>Soundpipe module</b></td>"
print "<td><b>Csound Opcode</b></td>"
print "</tr>"
}

{
csound_url="http://www.csounds.com/manual/html/" $2 ".html"
soundpipe_url="/res/soundpipe/docs/" $1 ".html"
print "<tr>"
print "<td><a href = '"soundpipe_url"'>" $1 "</a></td>"
print "<td><a href = '"csound_url"'>"$2 "</a></td>"
print "</tr>"
}

END {
print "</table>";
}
