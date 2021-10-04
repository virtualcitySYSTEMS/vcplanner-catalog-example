#!/bin/bash
if [[ ! -d "screenshot-glb-master" ]]; then
  wget https://github.com/Shopify/screenshot-glb/archive/refs/heads/master.zip
  unzip master.zip
  rm master.zip
  cd screenshot-glb-master
  npm i
  cd ..
fi

glbs=$(ls *.glb)
cd screenshot-glb-master

for glb in $glbs; do
  output=$(basename -s .glb $glb)
  echo "snapping $glb to $output.jpg"
  node src/cli.js -i ../$glb -o ../$output.jpg -f "image/jpeg" -w 40 -h 40
done
