# Download Bot Common
Common libraries for Pokemon Showdown web scrapers.

## Getting Started
### Building
```
sudo ./build.sh
```

### Pushing
```
# NOTE: Remember to replace the <tag> placeholder.

sudo docker push dnguyen0304/downloadbot_common-buildtime:<tag>
sudo docker push dnguyen0304/downloadbot_common-runtime:<tag>
```

## Advanced
### Testing the library.
1. Install `docker`.
2. Install `git`.
3. Clone the repository.
```
git clone https://github.com/dnguyen0304/downloadbot_common.git
```
4. Change the working directory.
```
cd downloadbot_common
```
5. Build the image.
```
sudo ./build.sh test
```
6. Run the test suite.
```
# NOTE: Remember to replace the <tag> placeholder.

sudo docker run dnguyen0304/downloadbot_common-runtime:<tag>
```

### Managing the base runtime image
1. Change the working directory to the package root directory.
2. Build the image.
```
sudo ./scripts/build-runtime-base.sh
```
3. Push the image.
```
# NOTE: Remember to replace the <tag> placeholder.

sudo docker push dnguyen0304/downloadbot_common-runtime-base:<tag>
```
