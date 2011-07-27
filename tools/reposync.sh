cd $HOME/src/wsAndroid/SuperTeam
repo sync
find . -path './rom' -prune -o -path './out' -prune -o -path '*/.git' -prune -o -path './.repo' -prune -o \! -type d -mtime -1 -print >> ../podxboq/out/cambios.txt
#for f in `cat ../podxboq/out/cambios.txt`; do cp ../SuperTeam/$f $f; done
