# Pull down existing ppa repo db files etc
mkdir -p ./output/repo
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% ffmpeg5*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavcodec59*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavdevice59*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavfilter8*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavformat59*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavutil57*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libpostproc56*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libswresample4*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libswscale6*)'

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
