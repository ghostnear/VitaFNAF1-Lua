# VitaFNAF1-Lua
FNAF1 remake for the PSVita. Work barely started, updates will follow.

# Building
- First copy the latest build of [lpp-vita](https://github.com/Rinnegatamante/lpp-vita) to the external folder and rename it to eboot.bin.

- Get the assets required for your build.

- Then just launch ./build.sh. The only dependency (will be) 7zip for making the archive with the final build.

## Info learned while making this
- require() crashes the app for no reason. Waiting for a fix...
- dofile() works the same as require() except you need an absolute path for it to work. Can even return values.
- the timers from the Timer module are not accurate and will get out of sync. Since the game uses VSync, I decided to limit the delta timing to 60fps => more accurate timing. Might revisit that and if I don't find a fix, I will submit an issue to the vita-lpp repo.

### [Old C++ version](https://github.com/ghostnear/VitaFNAF1)
