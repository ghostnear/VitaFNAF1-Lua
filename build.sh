# Make build folder
mkdir build
mkdir bin

# Copy all required files
cp -r sce_sys build/sce_sys
cp external/eboot.bin build/eboot.bin
cp external/assetlist.json build/assetlist.json
cp -r src/* build/
cp -r external/assets build/

# Make archive with the build
cd build
7z a -r ../bin/VitaFNAF1-Lua.vpk .