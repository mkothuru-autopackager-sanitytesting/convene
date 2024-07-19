# Packaging Notes for Convene

## Prerequisite
The following are the steps which has to setup prior run the packager

Correct node/npm/yarn version for application to be package has to present in the environment

npm / yarn install should be able to resolve all dependencies

The application should have the correct package.json for the application to work


## Docker

### Build

```bash
docker build --file .veracode/Dockerfile --tag pkgtest-react-native .
```

### Packaging

To run the manual packaging script run:

```bash
docker run --rm -v "$(pwd):/app" --entrypoint .veracode/manual-package.sh -w /app pkgtest-react-native
```

To run the auto-package script run:

```bash
docker run --rm -v "$(pwd):/app" --entrypoint .veracode/auto-package.sh -w /app pkgtest-react-native
```

To get an interactive shell with the project loaded (useful for debugging) run:

```bash
docker run --rm -it -v "$(pwd):/app" --entrypoint bash -w /app pkgtest-react-native
```
