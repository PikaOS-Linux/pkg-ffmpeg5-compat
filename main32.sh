# Clone Upstream
git clone https://github.com/FFmpeg/FFmpeg -b release/5.1
cp -rvf ./debian ./FFmpeg
mv ./FFmpeg ./ffmpeg
cd ./ffmpeg

# Get build deps
apt-get install dh-make -y
apt-get build-dep ./ -y

#for i in ../patches/* ; do echo "Applying Patch: $i" && patch -Np1 -i $i || echo "Applying Patch $i Failed!"; done

# Build package
dpkg-buildpackage --no-sign

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/
