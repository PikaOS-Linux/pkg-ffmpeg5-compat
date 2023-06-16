# Clone Upstream
git clone https://github.com/FFmpeg/FFmpeg -b release/5.1
cp -rvf ./debian ./FFmpeg
mv ./FFmpeg ./ffmpeg
cd ./ffmpeg

# Get build deps
apt-get install dh-make -y
apt-get build-dep ./ -y

# Build package
LOGNAME=root dh_make --createorig -y -l -p ffmpeg_5.1.3
dpkg-buildpackage

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
