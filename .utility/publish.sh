#!/bin/bash

if [ "$TRAVIS_REPO_SLUG" == "locationtech/geowave" ] && [ "$BUILD_AND_PUBLISH" == "true" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ]; then  
  echo $GPG_SECRET_KEYS | base64 --decode | $GPG_EXECUTABLE --import
  echo $GPG_OWNERTRUST | base64 --decode | $GPG_EXECUTABLE --import-ownertrust
  mvn deploy --settings .utility/.maven.xml -DskipTests -Dspotbugs.skip -B -U -Prelease
fi
