doxygen
ls
git remote -v
git checkout master
git status -uno
# make directories and copy over
#mkdir -p xml/${ABV}
mkdir -p docs/${ABV}
#cp -R temp/${ABV}/xml/* xml/${ABV}/.
cp -R temp/${ABV}/html/* docs/${ABV}/.
cp -R temp/rootcore_${ABV}.tag tagfiles/rootcore_${ABV}.tag
# add xml
#git add xml/${ABV} > /dev/null
#git commit -m "Adding xml for ${ABV}" --author="xAH-bot <giordon.holtsberg.stark@cern.ch>"
# update releases ran
echo ${ABV} >> releases
sort -ur -o releases releases
# update index.html for gh-pages
> docs/index.html
for release in `cat releases`; do echo "<li><a href='${release}/index.html'>${release}</a></li>" >> docs/index.html; done
# add html
git add docs/${ABV} tagfiles/*${ABV}.tag docs/index.html releases > /dev/null
git commit -m "Adding docs for ${ABV}" --author="xAH-bot <giordon.holtsberg.stark@cern.ch>"
git status -uno
