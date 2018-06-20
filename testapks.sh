#!/bin/bash
#List all installed packages on tablet
#Count to ensure there are nine for Standard content
#Launch each apk
adb devices
adb shell pm list packages -3
count="$(adb shell pm list packages -3 |wc -l)"
echo The number of installed apks = $count
if(("$count"==9)); then
adb devices | while read line
do
    # if it's not empty, use the next line
    if [ ! "$line" = "" ] && [ `echo $line | awk '{print $2}'` = "device" ];
    then 
	  sleep 2
      adb shell monkey -p org.scratchjr.android -c android.intent.category.LAUNCHER 1
	  echo Scratchjr launched successfully
	  sleep 5
      adb shell pm clear org.scratchjr.android
      adb shell monkey -p com.gmail.mrtnstolk.Swahili123 -c android.intent.category.LAUNCHER 1
	  echo Swahili123 launched successfully
	  sleep 5
      adb shell pm clear com.gmail.mrtnstolk.Swahili123
      adb shell monkey -p com.mcnaik.drenchgame -c android.intent.category.LAUNCHER 1
	  echo Drench game launched successfully
	  sleep 5
      adb shell pm clear com.mcnaik.drenchgame
      adb shell monkey -p com.gmail.programmersimeon.rooms_and_concepts -c android.intent.category.LAUNCHER 1
	  echo Rooms and concept launched successfully
	  sleep 5
      adb shell pm clear com.gmail.programmersimeon.rooms_and_concepts
      adb shell monkey -p uk.co.aifactory.chessfree -c android.intent.category.LAUNCHER 1
	  echo Chess launched successfully
	  sleep 5
	  adb shell pm clear uk.co.aifactory.chessfree
      adb shell monkey -p com.everafrica.Swahili_Wardrobe -c android.intent.category.LAUNCHER 1
	  echo Swahili Wardrobe launched successfully
	  sleep 5
	  adb shell pm clear com.everafrica.Swahili_Wardrobe
      adb shell monkey -p com.avochoc.stefan.Swahili_Shapes_and_Colours -c android.intent.category.LAUNCHER 1
	  echo Swahili shapes and colours launched successfully
	  sleep 5
	  adb shell pm clear com.avochoc.stefan.Swahili_Shapes_and_Colours
      adb shell monkey -p com.akbur.mathsworkout -c android.intent.category.LAUNCHER 1
	  echo Maths workout launched successfully
	  sleep 5
      adb shell pm clear com.akbur.mathsworkout
      adb shell am kill-all
      echo Test complete
	  fi
done
else
exit 1
fi