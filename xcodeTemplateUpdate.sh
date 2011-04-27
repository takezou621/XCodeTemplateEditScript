#!/bin/sh

pattern='LOG_METHOD'

basePath=/Developer/Platforms/iPhoneOS.platform/Developer/Library/Xcode/Project\ Templates/Application/

appType1=Navigation-based\ Application/Navigation-based\ Application/
appType2=Navigation-based\ Application/Navigation-based\ Core\ Data\ Application/
appType3=OpenGL\ ES\ Application/OpenGL\ ES\ iPhone\ Application/
appType4=OpenGL\ ES\ Application/OpenGL\ ES\ iPad\ Application/
appType5=Split\ View-based\ Application/Split\ View-based\ Application/
appType6=Split\ View-based\ Application/Split\ View-based\ Core\ Data\ Application/
appType7=Tab\ Bar\ Application/Tab\ Bar\ iPad\ Application/
appType8=Tab\ Bar\ Application/Tab\ Bar\ iPhone\ Application/
appType9=Utility\ Application/Utility\ iPhone\ Application/
appType10=Utility\ Application/Utility\ iPhone\ Core\ Data\ Application/
appType11=View-based\ Application/View-based\ iPad\ Application/
appType12=View-based\ Application/View-based\ iPhone\ Application/
appType13=Window-based\ Application/Window-based\ iPad\ Application/
appType14=Window-based\ Application/Window-based\ iPad\ Core\ Data\ Application/
appType15=Window-based\ Application/Window-based\ iPhone\ Application/
appType16=Window-based\ Application/Window-based\ iPhone\ Core\ Data\ Application/
appType17=Window-based\ Application/Window-based\ Universal\ Application/
appType18=Window-based\ Application/Window-based\ Universal\ Core\ Data\ Application/

appTypes=("$appType1" "$appType2" "$appType3" "$appType4" "$appType5" "$appType6" "$appType7" "$appType8" "$appType9" "$appType10" "$appType11" "$appType12" "$appType13" "$appType14" "$appType15" "$appType16" "$appType17" "$appType18")
 
fileName=___PROJECTNAMEASIDENTIFIER____Prefix.pch

appendStr='\n#if DEBUG\n#  define LOG(...) NSLog(__VA_ARGS__)\n#  define LOG_METHOD NSLog(@"%s", __func__)\n#else\n#  define LOG(...) ;\n#  define LOG_METHOD ;\n#endif'

i=0
cnt=17
while [ $i -le $cnt ]
do
  appType=${appTypes[$i]}
  path=$basePath"$appType"$fileName
  if cat "$path" | grep -q $pattern
    then
      echo "$path is already edited."
    else
      echo "EDIT $path."
      echo $appendStr >> $path
  fi
  i=$(($i+1))
done

