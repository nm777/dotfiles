#/bin/bash

CMD=code
if [ $# -gt 0 ]; then
    CMD="$@"
fi

"$CMD" --uninstall-extension EditorConfig.EditorConfig
"$CMD" --install-extension bmewburn.vscode-intelephense-client
"$CMD" --install-extension dbaeumer.vscode-eslint
"$CMD" --install-extension donjayamanne.githistory
"$CMD" --install-extension eg2.vscode-npm-script
"$CMD" --install-extension esbenp.prettier-vscode
"$CMD" --install-extension felixfbecker.php-debug
"$CMD" --install-extension felixfbecker.php-intellisense
"$CMD" --install-extension felixfbecker.php-pack
"$CMD" --install-extension formulahendry.auto-close-tag
"$CMD" --install-extension formulahendry.auto-rename-tag
"$CMD" --install-extension HookyQR.beautify
"$CMD" --install-extension jspolancor.presentationmode
"$CMD" --install-extension mauve.terraform
"$CMD" --install-extension ms-python.python
"$CMD" --install-extension ms-vscode.csharp
"$CMD" --install-extension ms-vscode.Go
"$CMD" --install-extension ms-vscode.PowerShell
"$CMD" --install-extension ms-vsliveshare.vsliveshare
"$CMD" --install-extension msjsdiag.debugger-for-chrome
"$CMD" --install-extension octref.vetur
"$CMD" --install-extension onecentlin.laravel-blade
"$CMD" --install-extension onecentlin.laravel-extension-pack
"$CMD" --install-extension onecentlin.laravel5-snippets
"$CMD" --install-extension PeterJausovec.vscode-docker
"$CMD" --install-extension ryannaddy.laravel-artisan
"$CMD" --install-extension vuetifyjs.vuetify-vscode
"$CMD" --install-extension wwm.better-align
"$CMD" --install-extension wesbos.theme-cobalt2
"$CMD" --install-extension johnpapa.winteriscoming
"$CMD" --install-extension mikestead.dotenv 

echo ''
echo 'You should also add the Fira Code fonts: https://github.com/tonsky/FiraCode'

"$CMD"
