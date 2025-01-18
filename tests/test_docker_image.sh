#!/bin/bash

# Run tests to verify installed tools
kubectl version --client
helm version
sops --version
talosctl help
talhelper help
task --version
flux --version
clustertool --help
git --version
curl --version
