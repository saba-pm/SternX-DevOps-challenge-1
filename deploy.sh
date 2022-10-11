#!/bin/bash
first=$(cat env.txt | gawk -F'=' '{print $1}')
second=($(cat env.txt | gawk -F'=' '{print $2}'))
COUNTER=0
echo -e "{\n    \"family\":\"\",\n    \"containerDefinitions\":[\n        {\n            \"name:\"\"\",\n            \"image\":\"\",\n            \"environment\":[\n" >> config.json
for i in ${first[@]} ; do
        echo -e "                {\n                   \"name\":\"$i\"\n                   \"value\":\"${second[$COUNTER]}\"\n                }," >> config.json
        COUNTER=$COUNTER+1
done
echo -e "\n            ],\n        }\n   ],\n}" >> config.json
