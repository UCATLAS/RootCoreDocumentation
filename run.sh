doxygen
ls
git remote -v
git checkout master
git status -uno
# make directories and copy over
if [ -d "docs/${ABV}" ]; then
  echo "docs/${ABV} exists, will remove first"
  git rm -rf docs/${ABV}/* &> /dev/null
fi
mkdir -p docs/${ABV}
echo "Copying files over now"
cp -R temp/${ABV}/html/* docs/${ABV}/.
cp -R temp/rootcore_${ABV}.tag tagfiles/rootcore_${ABV}.tag
# update releases ran
echo ${ABV} >> releases
sort -ur -o releases releases
# update index.html for gh-pages
> docs/index.html
for release in `cat releases`; do echo "<li><a href='${release}/index.html'>${release}</a></li>" >> docs/index.html; done
# add html
echo "Adding new files in"
git add docs/${ABV} tagfiles/*${ABV}.tag docs/index.html releases &> /dev/null
git commit -m "Adding docs for ${ABV}" --author="xAH-bot <giordon.holtsberg.stark@cern.ch>"
git status -uno
