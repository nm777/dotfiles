#/bin/bash

CMD=code
echo "Note: The executable for VSCode must be in your path."
echo ""
while true; do
    read -p "Use code-insiders? " yn
    case $yn in
        [Yy]* ) CMD=code-insiders; PROFILE_DIR="Code - Insiders"; break;;
        [Nn]* ) CMD=code; PROFILE_DIR=code; break;;
    esac
done

echo ""
echo "*************************************************************************"
echo "* Installing extensions for VSCode.                                     *"
echo "*                                                                       *"
echo "* You will need to manually add the Fira Code fonts:                    *"
echo "* https://github.com/tonsky/FiraCode                                    *"
echo "*************************************************************************"
echo ""

"$CMD" --uninstall-extension EditorConfig.EditorConfig

"$CMD" --install-extension alexcvzz.vscode-sqlite
"$CMD" --install-extension bmewburn.vscode-intelephense-client
"$CMD" --install-extension dbaeumer.vscode-eslint
"$CMD" --install-extension donjayamanne.githistory
"$CMD" --install-extension DotJoshJohnson.xml
"$CMD" --install-extension eamodio.gitlens
"$CMD" --install-extension eg2.vscode-npm-script
"$CMD" --install-extension esbenp.prettier-vscode
"$CMD" --install-extension felixfbecker.php-debug
"$CMD" --install-extension felixfbecker.php-intellisense
"$CMD" --install-extension felixfbecker.php-pack
"$CMD" --install-extension formulahendry.auto-close-tag
"$CMD" --install-extension formulahendry.auto-rename-tag
"$CMD" --install-extension GrapeCity.gc-excelviewer
"$CMD" --install-extension hollowtree.vue-snippets
"$CMD" --install-extension HookyQR.beautify
"$CMD" --install-extension johnpapa.winteriscoming
"$CMD" --install-extension jspolancor.presentationmode
"$CMD" --install-extension kokororin.vscode-phpfmt
"$CMD" --install-extension mauve.terraform
"$CMD" --install-extension mikestead.dotenv
"$CMD" --install-extension ms-python.python
"$CMD" --install-extension ms-vscode.csharp
"$CMD" --install-extension ms-vscode.Go
"$CMD" --install-extension ms-vscode.PowerShell
"$CMD" --install-extension ms-vsliveshare.vsliveshare
"$CMD" --install-extension msjsdiag.debugger-for-chrome
"$CMD" --install-extension mtxr.sqltools
"$CMD" --install-extension octref.vetur
"$CMD" --install-extension onecentlin.laravel-blade
"$CMD" --install-extension onecentlin.laravel-extension-pack
"$CMD" --install-extension onecentlin.laravel5-snippets
"$CMD" --install-extension PeterJausovec.vscode-docker
"$CMD" --install-extension ryannaddy.laravel-artisan
"$CMD" --install-extension vuetifyjs.vuetify-vscode
"$CMD" --install-extension wesbos.theme-cobalt2

platform="$(uname -s)"
vscodeSettings=""
case "${platform}" in
    Linux*          ) vscodeSettings="${HOME}/.config/${PROFILE_DIR}/User";;
    Darwin*         ) vscodeSettings="${HOME}/Library/Application Support/${PROFILE_DIR}/User";;
    CYGWIN*|MINGW*  ) vscodeSettings="$APPDATA/${PROFILE_DIR}/User";;
esac

if [ ! -z "$vscodeSettings" ]; then
    for f in $(find ./vscode -type f | sed "s|^./vscode/||"); do
        echo "Copying ${f}"
        cp "./vscode/${f}" "${vscodeSettings}/${f}"
    done
fi

"$CMD"
