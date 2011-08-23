touch cambios.txt
repo sync
find . -path './roms' -prune -o -path './out' -prune -o -path '*/.git' -prune -o -path './.repo' -prune -o \! -type d -newer cambios.txt -print >> cambios.txt
