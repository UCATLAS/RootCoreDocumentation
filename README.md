# RootCore Documentation Generation

This is the branch that signals the jobs that automatically generate documentation and update the master branch. In order to (re)generate a documentation for a release, edit the [.jenkins.yml](.jenkins.yml) file with the correct Analysis Base Version (ABV) to use. Then a commit+push will launch the job and hopefully go without error. Usually expect about 1 minute to run `doxygen` and about 20-30 seconds for GitHub pages to refresh.

## Authors

- [Giordon Stark](https://github.com/kratsg)
