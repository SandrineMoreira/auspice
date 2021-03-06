#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ]; then
  mkdir -p ~/.ssh 
  echo $SSH_CLEF | tr ' ' '\n' | base64 -d > ~/.ssh/id_rsa
  chmod og-rwx ~/.ssh/id_rsa 
  ssh-keyscan -H covseq.ca >> ~/.ssh/known_hosts 
  ssh web@covseq.ca ./update_auspice.sh 
fi
