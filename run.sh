doxygen
ls
git checkout master
git remote -v
git status
mv temp/${ABV}/html docs/${ABV}
mv temp/rootcore_${ABV}.tag tagfiles/rootcore_${ABV}.tag
echo ${ABV} >> releases
sort -ur -o releases releases
> docs/index.html
for release in `cat releases`; do echo "<li><a href='${release}/index.html'>${release}</a></li>" >> docs/index.html; done
ls docs/
ls docs/${ABV}
ls tagfiles
git add docs/${ABV} tagfiles/*${ABV}.tag docs/index.html releases
git status
git commit -m "Adding docs for ${ABV}" --author="xAH-bot <giordon.holtsberg.stark@cern.ch>"
git status
