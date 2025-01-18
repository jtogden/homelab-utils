# homelab-utils

This repository contains utilities and scripts for managing a homelab environment. It includes a Dockerfile for building a custom Docker image with various tools installed, as well as scripts for installing and testing these tools.

## Dockerfile

The [Dockerfile](Dockerfile) defines a custom Docker image based on `debian:bookworm-slim`. It installs various tools such as `kubectl`, `helm`, `sops`, `talosctl`, `talhelper`, `task`, `flux`, `clustertool`, `git`, and `curl`.

## Scripts

- [install_nanolayer_tools.sh](scripts/install_nanolayer_tools.sh): This script reads a list of tools from the `TOOLS` environment variable and installs them using the `nanolayer` command.
- [check_dockerfile_changes.sh](tests/check_dockerfile_changes.sh): This script checks if the Dockerfile has changed and ensures that the test script has been updated accordingly.
- [test_docker_image.sh](tests/test_docker_image.sh): This script runs tests to verify that the installed tools are working correctly.

## GitHub Actions

The repository includes a GitHub Actions workflow defined in [.github/workflows/docker-build.yml](.github/workflows/docker-build.yml). The workflow includes the following jobs:

- `check`: Checks for changes in the Dockerfile and ensures consistency with the test script.
- `build`: Builds and pushes the Docker image to the GitHub Container Registry.
- `scan`: Scans the Docker image for vulnerabilities using Trivy.
- `test`: Builds the Docker image and runs tests to verify the installed tools.

## Development Container

The repository includes a development container configuration in [.devcontainer/devcontainer.json](.devcontainer/devcontainer.json). This configuration allows you to use Visual Studio Code with a containerized development environment.

## Usage

To build the Docker image locally, run:

```sh
docker build -t homelab-utils .
```
To run the tests locally, run:
```sh
./scripts/test_docker_image.sh
```
To check that tests were added when changes to the Dockerfile were made, run:
```sh
./tests/check_dockerfile_changes.sh
```
Use this image in a `devcontainer.json` file or run interactively with this command:
```sh
docker run -it -v ${PWD}:/workspace ghcr.io/jtogden/homelab-utils/homelab-utils:latest
```
## Contributing
Contributions are welcome! Please open an issue or submit a pull request with your changes.

## License
This project is licensed under the MIT License