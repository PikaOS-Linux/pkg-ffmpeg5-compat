# Pull down existing ppa repo db files etc
mkdir -p ./output/repo
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% ffmpeg5*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavcodec59*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavdevice59*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavfilter8*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavformat59*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libavutil57*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libpostproc56*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libswresample4*)'
reprepro -V --basedir ./output/repo/ removefilter lunar 'Package (% libswscale6*)'

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
