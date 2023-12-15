#!/bin/sh
set -e
#source ../env/bin/activate

# Use gftools builder 0.9.33. Read notes at the end.

vf=Lexend[SPAC,wdth,wght].ttf
vfi=Lexend-Italic[SPAC,wdth,wght].ttf

echo ".
BUILD LEXEND
."

gftools builder lexend.yaml

echo ".
BUILD DECA
."

gftools builder deca.yaml
fonttools varLib.instancer ../fonts/deca/variable/$vf SPAC=0 wdth=100 --output ../fonts/deca/variable/LexendDeca[wght].ttf
fonttools varLib.instancer ../fonts/deca/variable/$vfi SPAC=0 wdth=100 --output ../fonts/deca/variable/LexendDeca-Italic[wght].ttf  
rm ../fonts/deca/variable/$vf ../fonts/deca/variable/$vfi

echo ".
BUILD EXA
."

gftools builder exa.yaml
fonttools varLib.instancer ../fonts/exa/variable/$vf SPAC=34 wdth=110 --output ../fonts/exa/variable/LexendExa[wght].ttf
fonttools varLib.instancer ../fonts/exa/variable/$vfi SPAC=34 wdth=110 --output ../fonts/exa/variable/LexendExa-Italic[wght].ttf  
rm ../fonts/exa/variable/$vf ../fonts/exa/variable/$vfi


echo ".
BUILD GIGA
."

gftools builder giga.yaml
fonttools varLib.instancer ../fonts/giga/variable/$vf SPAC=48 wdth=114 --output ../fonts/giga/variable/LexendGiga[wght].ttf
fonttools varLib.instancer ../fonts/giga/variable/$vfi SPAC=48 wdth=114 --output ../fonts/giga/variable/LexendGiga-Italic[wght].ttf  
rm ../fonts/giga/variable/$vf ../fonts/giga/variable/$vfi


echo ".
BUILD MEGA
."

gftools builder mega.yaml
fonttools varLib.instancer ../fonts/mega/variable/$vf SPAC=55 wdth=116 --output ../fonts/mega/variable/LexendMega[wght].ttf
fonttools varLib.instancer ../fonts/mega/variable/$vfi SPAC=55 wdth=116 --output ../fonts/mega/variable/LexendMega-Italic[wght].ttf  
rm ../fonts/mega/variable/$vf ../fonts/mega/variable/$vfi


echo ".
BUILD PETA
."

gftools builder peta.yaml
fonttools varLib.instancer ../fonts/peta/variable/$vf SPAC=61 wdth=118 --output ../fonts/peta/variable/LexendPeta[wght].ttf
fonttools varLib.instancer ../fonts/peta/variable/$vfi SPAC=61 wdth=118 --output ../fonts/peta/variable/LexendPeta-Italic[wght].ttf  
rm ../fonts/peta/variable/$vf ../fonts/peta/variable/$vfi


echo ".
BUILD TERA
."

gftools builder tera.yaml
fonttools varLib.instancer ../fonts/tera/variable/$vf SPAC=67 wdth=120 --output ../fonts/tera/variable/LexendTera[wght].ttf
fonttools varLib.instancer ../fonts/tera/variable/$vfi SPAC=67 wdth=120 --output ../fonts/tera/variable/LexendTera-Italic[wght].ttf  
rm ../fonts/tera/variable/$vf ../fonts/tera/variable/$vfi

gftools gen-stat ../fonts/tera/variable/*.ttf --src stat.yaml --inplace


echo ".
BUILD ZETTA
."

gftools builder zetta.yaml
fonttools varLib.instancer ../fonts/zetta/variable/$vf SPAC=86 wdth=125 --output ../fonts/zetta/variable/LexendZetta[wght].ttf
fonttools varLib.instancer ../fonts/zetta/variable/$vfi SPAC=86 wdth=125 --output ../fonts/zetta/variable/LexendZetta-Italic[wght].ttf  
rm ../fonts/zetta/variable/$vf ../fonts/zetta/variable/$vfi


echo ".
MOVE STATICS TO THEIR OWN DIR
."
rm -rf ../fonts/deca/ttf ../fonts/exa/ttf ../fonts/giga/ttf ../fonts/mega/ttf ../fonts/peta/ttf ../fonts/tera/ttf ../fonts/zetta/ttf
mkdir -p ../fonts/deca/ttf ../fonts/exa/ttf ../fonts/giga/ttf ../fonts/mega/ttf ../fonts/peta/ttf ../fonts/tera/ttf ../fonts/zetta/ttf
mv ../fonts/lexend/ttf/*Deca* ../fonts/deca/ttf/
mv ../fonts/lexend/ttf/*Exa* ../fonts/exa/ttf/
mv ../fonts/lexend/ttf/*Giga* ../fonts/giga/ttf/
mv ../fonts/lexend/ttf/*Mega* ../fonts/mega/ttf/
mv ../fonts/lexend/ttf/*Peta* ../fonts/peta/ttf/
mv ../fonts/lexend/ttf/*Tera* ../fonts/tera/ttf/
mv ../fonts/lexend/ttf/*Zetta* ../fonts/zetta/ttf/

echo ".
COMPLETE!
."


# # Build for one subfamily with gftools > 0.9.33 that is "broken" cf issue https://github.com/googlefonts/gftools/issues/802
# # After building Lexend: slice VF
# fonttools varLib.instancer ../fonts/lexend/variable/$vf SPAC=0 wdth=100 --output ../fonts/deca/variable/Lexend[wght].ttf
# fonttools varLib.instancer ../fonts/lexend/variable/$vfi SPAC=0 wdth=100 --output ../fonts/deca/variable/Lexend-Italic[wght].ttf

# # rename family
# gftools rename-font ../fonts/deca/variable/Lexend[wght].ttf "Lexend Deca"
# gftools rename-font ../fonts/deca/variable/Lexend-Italic[wght].ttf "Lexend Deca"

# rm ../fonts/deca/variable/Lexend[wght].ttf ../fonts/deca/variable/Lexend-Italic[wght].ttf

# # re-instate previous copyright notice
# gftools update-nameids ../fonts/deca/variable/LexendDeca[wght].ttf -c "Copyright 2019 The Lexend Project Authors (https://github.com/googlefonts/lexend)"
# gftools update-nameids ../fonts/deca/variable/LexendDeca-Italic[wght].ttf -c "Copyright 2019 The Lexend Project Authors (https://github.com/googlefonts/lexend)"

# mv -f ../fonts/deca/variable/LexendDeca[wght].ttf.fix ../fonts/deca/variable/LexendDeca[wght].ttf
# mv -f ../fonts/deca/variable/LexendDeca-Italic[wght].ttf.fix ../fonts/deca/variable/LexendDeca-Italic[wght].ttf

# # patch a STAT table
# gftools gen-stat ../fonts/deca/variable/LexendDeca[wght].ttf --src stat.yaml --inplace
# gftools gen-stat ../fonts/deca/variable/LexendDeca-Italic[wght].ttf --src stat-ital.yaml --inplace