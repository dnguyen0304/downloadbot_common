# Download Bot Common
Common libraries for Pokemon Showdown web scrapers.

NOTE: Remember to replace the <tag> placeholder where applicable.

## Getting Started
### Adding the library.
For projects using setup.py:
```
install_requires = ['downloadbot_common==<tag>']
dependency_links = ['git+https://github.com/dnguyen0304/downloadbot_common.git@<tag>#egg=downloadbot_common-<tag>']

setuptools.setup(install_requires=install_requires,
                 dependency_links=dependency_links)
```

For projects using requirements.txt:
```
git+https://github.com/dnguyen0304/downloadbot_common.git@{tag}#egg=downloadbot_common
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
sudo docker run dnguyen0304/downloadbot_common-runtime:<tag>
```
7. Pushing the images.
```
sudo docker push dnguyen0304/downloadbot_common-buildtime:<tag>
sudo docker push dnguyen0304/downloadbot_common-runtime:<tag>
```

### Managing the base runtime image
1. Change the working directory to the package root directory.
2. Build the image.
```
sudo ./scripts/build-runtime-base.sh
```
3. Push the image.
```
sudo docker push dnguyen0304/downloadbot_common-runtime-base:<tag>
```
