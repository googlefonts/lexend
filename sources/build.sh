#!/bin/sh
set -e
#source ../env/bin/activate

vf=Lexend[HEXP,wght].ttf

echo ".
BUILD LEXEND AND ALL STATICS
."

gftools builder lexend.yaml
fonttools varLib.instancer ../fonts/lexend/variable/$vf HEXP=0 --output ../fonts/lexend/variable/Lexend[wght].ttf
rm ../fonts/lexend/variable/$vf

echo ".
BUILD DECA
."

gftools builder deca.yaml
fonttools varLib.instancer ../fonts/deca/variable/$vf HEXP=0 --output ../fonts/deca/variable/LexendDeca[wght].ttf 
rm ../fonts/deca/variable/$vf

echo ".
BUILD EXA
."
gftools builder exa.yaml
fonttools varLib.instancer ../fonts/exa/variable/$vf HEXP=40 --output ../fonts/exa/variable/LexendExa[wght].ttf 
rm ../fonts/exa/variable/$vf

echo ".
BUILD GIGA
."
gftools builder giga.yaml
fonttools varLib.instancer ../fonts/giga/variable/$vf HEXP=56 --output ../fonts/giga/variable/LexendGiga[wght].ttf 
rm ../fonts/giga/variable/$vf

echo ".
BUILD MEGA
."
gftools builder mega.yaml
fonttools varLib.instancer ../fonts/mega/variable/$vf HEXP=64 --output ../fonts/mega/variable/LexendMega[wght].ttf 
rm ../fonts/mega/variable/$vf

echo ".
BUILD PETA
."
gftools builder peta.yaml
fonttools varLib.instancer ../fonts/peta/variable/$vf HEXP=72 --output ../fonts/peta/variable/LexendPeta[wght].ttf 
rm ../fonts/peta/variable/$vf

echo ".
BUILD TERA
."
gftools builder tera.yaml
fonttools varLib.instancer ../fonts/tera/variable/$vf HEXP=80 --output ../fonts/tera/variable/LexendTera[wght].ttf 
rm ../fonts/tera/variable/$vf

echo ".
BUILD ZETTA
."
gftools builder zetta.yaml
fonttools varLib.instancer ../fonts/zetta/variable/$vf HEXP=100 --output ../fonts/zetta/variable/LexendZetta[wght].ttf 
rm ../fonts/zetta/variable/$vf

echo ".
MOVE STATICS TO THEIR OWN DIR
."
rm -rf ../fonts/deca/ttf ../fonts/exa/ttf ../fonts/giga/ttf ../fonts/mega/ttf ../fonts/peta/ttf ../fonts/tera/ttf ../fonts/zetta/ttf
mkdir -p ../fonts/deca/ttf ../fonts/exa/ttf ../fonts/giga/ttf ../fonts/mega/ttf ../fonts/peta/ttf ../fonts/tera/ttf ../fonts/zetta/ttf
mv ../fonts/lexend/ttf/*Deca* ../fonts/Deca/ttf/
mv ../fonts/lexend/ttf/*Exa* ../fonts/Exa/ttf/
mv ../fonts/lexend/ttf/*Giga* ../fonts/Giga/ttf/
mv ../fonts/lexend/ttf/*Mega* ../fonts/Mega/ttf/
mv ../fonts/lexend/ttf/*Peta* ../fonts/Peta/ttf/
mv ../fonts/lexend/ttf/*Tera* ../fonts/Tera/ttf/
mv ../fonts/lexend/ttf/*Zetta* ../fonts/Zetta/ttf/


echo ".
COMPLETE!
."
