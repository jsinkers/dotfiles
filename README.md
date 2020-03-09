## Installing vim plugins

- add git submodule
```
git submodule add <url> vim/pack/vendor/start/<plugin name>
```
- install docs: something like
```
vim -u NONE -c "helptags vim/pack/vendor/start/<plugin name>/doc" -c q
```
