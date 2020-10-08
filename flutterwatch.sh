#!/bin/sh
while true
do
    find lib/ -name '*.dart' | \
        entr -d -p ~/localdevs/flutterreloader.sh /_
done
