#/bin/bash

# The VSCode executable:
if [ -z "$1" ]; then
    CMD=code

    # Install VSCode if it's missing
    if ! which code; then
        echo ""
        echo "Installing VSCode..."
        wget -O /tmp/vscode.deb 'https://go.microsoft.com/fwlink/?LinkID=760868'
        sudo dpkg -i /tmp/vscode.deb
    fi
else
    CMD="$1"
fi

# The directory where user settings are stored:
platform="$(uname -s)"
vscodeSettings=""
if [ -z "$2" ]; then
    case "${platform}" in
        Linux*)
            vscodeSettings="${HOME}/.config/Code/User"
            ;;
        Darwin*)
            vscodeSettings="${HOME}/Library/Application Support/Code/User"
            ;;
        CYGWIN*|MINGW*)
            vscodeSettings="$APPDATA/Code/User"
            ;;
    esac
else
    # e.g. $2 = /some/folder/code-portable-data/user-data
    vscodeSettings="$2/User"
fi

# Fix paths that might have case issues
case "${platform}" in
    Linux*|Darwin*)
        vscodeSettings=$(find / -type d -ipath "${vscodeSettings}" 2>/dev/null)
        ;;
esac


# https://github.com/tonsky/FiraCode
if which apt-get; then
    echo ""
    echo "Installing FiraCode fonts..."
    sudo apt-get update && sudo apt-get install -y fonts-firacode
else
    echo "You should install Fira Code fonts manually:"
    echo "https://github.com/tonsky/FiraCode"
fi

echo ""
echo "Installing extensions for VSCode..."

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
"$CMD" --install-extension johnpapa.winteriscoming
"$CMD" --install-extension jspolancor.presentationmode
"$CMD" --install-extension kokororin.vscode-phpfmt
"$CMD" --install-extension mauve.terraform
"$CMD" --install-extension mehedidracula.php-namespace-resolver
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
"$CMD" --install-extension phiter.phpstorm-snippets
"$CMD" --install-extension PeterJausovec.vscode-docker
"$CMD" --install-extension ryannaddy.laravel-artisan
"$CMD" --install-extension vuetifyjs.vuetify-vscode
"$CMD" --install-extension wesbos.theme-cobalt2


echo ""
echo "Copying configuration..."

if [ ! -z "$vscodeSettings" ]; then
    for f in $(find ./vscode -type f | sed "s|^./vscode/||"); do
        TARGET_DIR=$(dirname "${vscodeSettings}/${f}")
        if [ ! -d "${TARGET_DIR}" ]; then
            mkdir "${TARGET_DIR}"
        fi
        echo "Copying ${f}"
        cp "./vscode/${f}" "${vscodeSettings}/${f}"
    done
fi

