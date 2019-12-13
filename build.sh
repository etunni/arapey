TTFDIR=./fonts/statis/ttf
VFDIR=./fonts
mkdir -p $TTFDIR
mkdir -p $VFDIR
rm -r $TTFDIR/*.ttf
rm -r $VFDIR/*.ttf

# # Build static instances
# fontmake -g ./Sources/Petrona-ROMAN-MASTER-NEW-W.glyphs -o ttf -i --output-dir $TTFDIR -a
# fontmake -g ./Sources/Petrona-ITALIC-MASTER-NEW-W.glyphs -o ttf -i --output-dir $TTFDIR -a
# for f in $TTFDIR/*.ttf
# do
# 	echo Processing $f
# 	gftools fix-dsig --autofix $f
# 	gftools fix-hinting $f
# 	mv $f.fix $f
# done

# Build variable font
set -e
VF_FILENAME=$VFDIR/Arapey[opsz,wght].ttf
fontmake -g ./src/Arapey-VF-pro-NOV.glyphs -o variable --output-path $VF_FILENAME
gftools fix-dsig --autofix $VF_FILENAME
ttfautohint $VF_FILENAME $VF_FILENAME.fix
mv $VF_FILENAME.fix $VF_FILENAME
gftools fix-hinting $VF_FILENAME
mv $VF_FILENAME.fix $VF_FILENAME

# Clean up
rm -r instance_ufo
rm -r master_ufo