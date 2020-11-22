#!/usr/bin/env sh

while getopts ":d:f:" opt; do
  case $opt in
    d) ARG_1="$OPTARG"
    ;;
    f) ARG_2="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

CURRENT_DIR=${ARG_1:-$PWD}
RELATIVE_DIR=$(realpath --relative-base=$PWD $CURRENT_DIR)

BASENAME=$(/usr/bin/basename $CURRENT_DIR | /usr/bin/tr -d .)
FILE_NUM=$((`ls $CURRENT_DIR/${BASENAME}_* 2>/dev/null | /usr/bin/wc -l` + 1))
DEFAULT_FILENAME=${BASENAME}_${FILE_NUM}
FILENAME=${ARG_2:-$DEFAULT_FILENAME}.png
OUTPUT=$CURRENT_DIR/$FILENAME

/usr/bin/maim -q -s -k $OUTPUT

echo "$RELATIVE_DIR/$FILENAME"
