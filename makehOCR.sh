if [[ -d "$1" ]]
then
    OIFS="$IFS"
    IFS=$'\n'
    for pdfPage in `ls "$1"/*.json`; do
        if [[ `basename $pdfPage` == 'metadata.json' ]]; then continue; fi
        # imageName=`dirname $pdfPage`/`basename "$pdfPage" .json`.png
        # line=`cat "$1"/*.xml | grep "$imageName"`
        # height=`echo $line | sed -n 's/.*height="\([^"]*\).*/\1/p'`
        # width=`echo $line | sed -n 's/.*width="\([^"]*\).*/\1/p'`
        # echo "PARAMS: $imagename $line $height $width"
        outf="`dirname $pdfPage`/`basename \"$pdfPage\" .json`.hocr"
        echo "./lib/gcv2hocr.py \"$pdfPage\" -H 1764 -W 2283 > \"$outf\""
        ./lib/gcv2hocr.py "$pdfPage" -H 1764 -W 2283 > "$outf"
    done
    IFS="$OIFS"
else
    echo "Provided argument is not a directory"
fi