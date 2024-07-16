REM Update latest dotfiles from git

rm %USERPROFILE%\_vimrc %USERPROFILE%\_gvimrc

cp  %USERPROFILE%\Documents\GitHub\dotfiles\vimrc %USERPROFILE%\_vimrc
cp  %USERPROFILE%\Documents\GitHub\dotfiles\gvimrc %USERPROFILE%\_gvimrc

