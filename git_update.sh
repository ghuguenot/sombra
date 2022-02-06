#!/bin/bash

cd ~/sombra
git add .
echo -e "Enter Commit Name"
read name
git commit -m "$name"
git push

