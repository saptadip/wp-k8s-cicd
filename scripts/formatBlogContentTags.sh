fileNm=$1
tagNm=$2

case "$tagNm" in

  paragraph)
    echo "Inside Paragraph"
    #x=$(grep -n "wp:paragraph" $fileNm | grep -v "/wp:" | awk -F ":" '{print $1}')
    #y=$(grep -n "/wp:paragraph" $fileNm | awk -F ":" '{print $1}')

    grep -n "wp:paragraph" $fileNm | grep -v "/wp:" | awk -F ":" '{print $1}' | while read line
    do
      sed -i '' "${line}s/.*/\<paragraph\>/" $fileNm 
    done

    grep -n "/wp:paragraph" $fileNm | awk -F ":" '{print $1}' | while read line
    do
      sed -i '' "${line}s/.*/\<\/paragraph\>/" $fileNm
    done
    ;;

  heading)
    echo "Inside Heading"
    x=$(grep -n "wp:heading" $fileNm | grep -v "/wp:" | awk -F ":" '{print $1}')
    y=$(grep -n "/wp:heading" $fileNm | awk -F ":" '{print $1}')

    grep -n "wp:heading" $fileNm | grep -v "/wp:" | awk -F ":" '{print $1}' | while read line
    do
      sed -i '' "${line}s/.*/\<heading\>/" $fileNm
    done

    grep -n "/wp:heading" $fileNm | awk -F ":" '{print $1}' | while read line
    do
      sed -i '' "${line}s/.*/\<\/heading\>/" $fileNm 
    done
    ;;

esac
