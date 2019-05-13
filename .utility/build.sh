#!/bin/bash
set -ev

if [ "$TRAVIS_REPO_SLUG" == "locationtech/geowave" ] && [ "$BUILD_AND_PUBLISH" == "true" ]; then
  echo -e "Building docs...\n"
  mvn -P html -pl docs install -DskipTests -Dspotbug.skip
  
  echo -e "Installing local artifacts...\n"
  mvn install -DskipTests -Dspotbugs.skip
  
  echo -e "Building javadocs...\n"
  mvn javadoc:aggregate -DskipTests -Dspotbugs.skip
fi
