# VitaFNAF1-Lua
FNAF1 remake for the PSVita. Work barely started, updates will follow.

# Building
- First copy the latest build of [lpp-vita](https://github.com/Rinnegatamante/lpp-vita) to the external folder and rename it to eboot.bin.

- Get the assets required for your build.

- Then just launch ./build.sh. The only dependency (will be) 7zip for making the archive with the final build.

## Info learned while making this
- require() crashes the app for no reason. Waiting for a fix...
- dofile() works the same as require() except you need an absolute path for it to work. Can even return values.