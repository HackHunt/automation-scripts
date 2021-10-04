go get -u github.com/tomnomnom/anew
curl https://sh.rustup.rs -sSf | sh
#finddomain-installation
git clone https://github.com/findomain/findomain.git && cd findomain && cargo build --release && sudo cp target/release/findomain /usr/bin/findomain
#knockpy
git clone https://github.com/guelfoweb/knock.git && python3 setup.py install
