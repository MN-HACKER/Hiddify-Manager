export DEBIAN_FRONTEND=noninteractive
export USE_VENV=true

echo "we are going to download needed files:)"
GITHUB_REPOSITORY=hiddify-config
GITHUB_USER=MN-HACKER
GITHUB_BRANCH_OR_TAG=main

apt update
apt install -y curl unzip
mkdir -p /opt/$GITHUB_REPOSITORY
cd /opt/$GITHUB_REPOSITORY
curl -L -s -o $GITHUB_REPOSITORY.zip https://github.com/MN-HACKER/$GITHUB_REPOSITORY/releases/download/v10.5.73/$GITHUB_REPOSITORY.zip
unzip -o $GITHUB_REPOSITORY.zip > /dev/null
rm $GITHUB_REPOSITORY.zip
rm -f xray/configs/*.json
rm -f singbox/configs/*.json
source /opt/hiddify-config/common/utils.sh
install_python
install_pypi_package pip==24.0
pip install -U hiddifypanel==8.8.99
bash install.sh --no-gui

sed -i "s|/opt/$GITHUB_REPOSITORY/menu.sh||g" ~/.bashrc
sed -i "s|cd /opt/$GITHUB_REPOSITORY/||g" ~/.bashrc
echo "/opt/$GITHUB_REPOSITORY/menu.sh" >>~/.bashrc
echo "cd /opt/$GITHUB_REPOSITORY/" >>~/.bashrc
if [ "$CREATE_EASYSETUP_LINK" == "true" ];then
    cd /opt/$GITHUB_REPOSITORY/hiddify-panel
    hiddify-panel-cli set-setting --key create_easysetup_link --val True
fi

hiddify-panel-cli set-setting --key auto_update --val False

read -p "Press any key to go  to menu" -n 1 key
cd /opt/$GITHUB_REPOSITORY
bash menu.sh
