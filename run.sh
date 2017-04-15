doxygen
ls
git remote -v
git checkout master
git status -uno
mkdir -p docs/${ABV}
cp -R temp/${ABV}/html/* docs/${ABV}/.
cp -R temp/rootcore_${ABV}.tag tagfiles/rootcore_${ABV}.tag
echo ${ABV} >> releases
sort -ur -o releases releases
> docs/index.html
for release in `cat releases`; do echo "<li><a href='${release}/index.html'>${release}</a></li>" >> docs/index.html; done
ls docs/
ls docs/${ABV}
ls tagfiles
git add docs/${ABV} tagfiles/*${ABV}.tag docs/index.html releases
git commit -m "Adding docs for ${ABV}" --author="xAH-bot <giordon.holtsberg.stark@cern.ch>"
git status -uno
# this part handles moving the xml over
git checkout xml
mkdir -p xml/${ABV}
cp -R temp/${ABV}/xml/* xml/${ABV}/.
git add xml/${ABV}
git commit -m "Adding xml for ${ABV}" --author="xAH-bot <giordon.holtsberg.stark@cern.ch>"
git status -uno
