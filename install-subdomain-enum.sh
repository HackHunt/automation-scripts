go get -u github.com/tomnomnom/anew
curl https://sh.rustup.rs -sSf | sh
#finddomain-installation
git clone https://github.com/findomain/findomain.git && cd findomain && cargo build --release && sudo cp target/release/findomain /usr/bin/findomain
#knockpy
git clone https://github.com/guelfoweb/knock.git && python3 setup.py install
#assetfinder
go get -u github.com/tomnomnom/assetfinder
#subfinder
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
#subdomanizer
sudo git clone https://github.com/nsonaniya2010/SubDomainizer.git && cd  SubDomainizer && pip3 install -r requirements.txt && sudo mv SubDomainizer.py SubDomainizer && mv SubDomainizer /usr/bin/subdomanizer
#Amass
sudo snap install amass
