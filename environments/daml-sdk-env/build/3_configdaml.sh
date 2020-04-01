#!/bin/bash
cat <<EOF > /opt/configure-environment.sh
#!/bin/bash
echo "PATH=\$PATH:~/.daml/bin" >> ~/.bashrc
source ~/.bashrc

# uninstall unnecessary extensions
rm -rf /opt/.katacodacode/extensions/redhat.vscode-openshift-connector-0.0.19/;
rm -rf /tmp/.katacodacode/extensions/redhat.vscode-openshift-connector-0.0.19/;

# install daml extension
cd /tmp && wget http://assets.joinscrapbook.com/daml/DigitalAssetHoldingsLLC.daml-0.13.55.vsix;
mv DigitalAssetHoldingsLLC.daml-0.13.55.vsix daml-0.13.55.zip;
mkdir daml-0.13.55 && unzip daml-0.13.55.zip -d daml-0.13.55;
mv daml-0.13.55/extension /opt/.katacodacode/extensions/daml-0.13.55;
rm /tmp/daml-0.13.55.zip;
rm -Rf /tmp/daml-0.13.55;
EOF

chmod +x /opt/configure-environment.sh
/opt/configure-environment.sh
rm /opt/configure-environment.sh
