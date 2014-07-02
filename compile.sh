#!/bin/sh

optimize() {
	hash perl 2>/dev/null
	if [ $? -ne 0 ] ; then
		return
	fi

	perl -0pi -e 's|\t\s*push\s+(\S+)\s+push\s+(\S+)\s+pop\s+(\S+)\s+pop\s+(\S+)|\tmovq \1,\4\n\tmovq \2,\3|g' "$1"
	perl -0pi -e 's|\t\s*push\s+(\S+)\s+pop\s+(\S+)|\tmovq \1,\2|g' "$1"
	perl -0pi -e 's|\t\s*mov.\s+(\S+),\1\n||g' "$1"
	
	perl -0pi -e 's|\t\s*add\s+\$8,%rsp\n\s*add\s+\$8,%rsp\n\s*add\s+\$8,%rsp|\tadd \$24,%rsp|g' "$1"
	perl -0pi -e 's|\t\s*add\s+\$8,%rsp\n\s*add\s+\$8,%rsp|\tadd \$16,%rsp|g' "$1"
}

DIR="$(dirname "$(readlink -f "$0")")"

echo "($1) compile" | gs -q "$DIR/compile.ps" > /dev/null

optimize main.s
optimize func.s


