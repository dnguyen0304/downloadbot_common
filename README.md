# Download Bot Common
Common libraries for Pokemon Showdown web scrapers.

## Getting Started
### Building
```
sudo ./build.sh
```

## Advanced
### Managing the base runtime image
1. Change the working directory to the package root directory.
2. Build the image.
```
sudo ./scripts/build-runtime-base.sh
```
3. Push the image.
```
# NOTE: Remember to replace the <tag> placeholder.

sudo docker push dnguyen0304/downloadbot.common-runtime-base:<tag>
```
