#!/bin/bash

# Check if Dockerfile has changed
if git diff --name-only HEAD~1 | grep -q "Dockerfile"; then
  # Check for additions to the TOOLS environment variable
  if git diff HEAD~1 Dockerfile | grep -q "^+\s*ENV TOOLS="; then
    # Check if test script has changed
    if ! git diff --name-only HEAD~1 | grep -q "scripts/test_docker_image.sh"; then
      echo "Error: TOOLS environment variable has changed but test script has not been updated."
      exit 1
    fi
  fi

  # Check for additions to the entire RUN block
  if git diff HEAD~1 Dockerfile | grep -q "^+\s*RUN apt update && apt -y upgrade && apt install -y"; then
    # Check if test script has changed
    if ! git diff --name-only HEAD~1 | grep -q "scripts/test_docker_image.sh"; then
      echo "Error: RUN block has changed but test script has not been updated."
      exit 1
    fi
  fi
fi

echo "Dockerfile and test script changes are consistent."
exit 0