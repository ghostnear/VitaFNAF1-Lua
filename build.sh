# Make build folder
mkdir build
mkdir bin

# Copy all required files
cp -r sce_sys build/sce_sys
cp external/eboot.bin build/eboot.bin
cp -r src/* build/

# Make archive with the build
cd build
7z a -mm=Deflate -mfb=258 -mpass=15 -r ../bin/VitaFNAF1.vpk .