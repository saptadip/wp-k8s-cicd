fileNm=$1
tagNm=$2


updateXml () {
    data=$1 
    grep -n "${data}" $fileNm | grep -v "/wp:" | awk -F ":" '{print $1}' | while read line
    do
      sed -i '' "${line}s/.*/\<${data/:/-}\>/" $fileNm
    done

    grep -n "/${data}" $fileNm | awk -F ":" '{print $1}' | while read line
    do
      sed -i '' "${line}s/.*/\<\/${data/:/-}\>/" $fileNm
    done
}



case "$tagNm" in

  paragraph)
    echo "Inside Paragraph"
    updateXml "wp:paragraph"
    ;;

  heading)
    echo "Inside Heading"
    updateXml "wp:heading"
    ;;

  spacer)
    echo "Inside Spacer"
    updateXml "wp:spacer"
    ;;

  list)
    echo "Inside List"
    updateXml "wp:list"
    ;;

  separator)
    echo "Inside Separator"
    updateXml "wp:separator"
    ;;

  code)
    echo "Inside Code"
    updateXml "wp:code"
    ;;

  image)
    echo "Inside Image"
    updateXml "wp:image"
    ;;

esac

