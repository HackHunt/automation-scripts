if [ -z "$1" ]
then
	echo "please input the name of the domain"
else
	dir=~/bug/$1
	mkdir -p $dir
	echo "crt.sh" # The name should be specified with echo while contributing
	curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | anew $dir/$1_subdomains; # oneliner command that fetches results from crt.sh
	echo "rapiddns"
	curl -s "https://rapiddns.io/subdomain/$1?full=1#result" | grep "<td><a" | cut -d '"' -f 2 | grep http | cut -d '/' -f3 | sed 's/#results//g' | sort -u | anew $dir/$1_subdomains;
	echo "bufferoverflow"
	curl -s https://dns.bufferover.run/dns?q=.$1 |jq -r .FDNS_A[]|cut -d',' -f2|sort -u | anew $dir/$1_subdomains;
	echo "riddle"
	curl -s "https://riddler.io/search/exportcsv?q=pld:$1" | grep -Po "(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u | anew $dir/$1_subdomains;
	echo "certspoter"
	curl -s "https://certspotter.com/api/v1/issuances?domain=$1&include_subdomains=true&expand=dns_names" | jq .[].dns_names | tr -d '[]"\n ' | tr ',' '\n' | anew $dir/$1_subdomains;
	echo "web-archive"
	curl -s "http://web.archive.org/cdx/search/cdx?url=*.$1/*&output=text&fl=original&collapse=urlkey" | sed -e 's_https*://__' -e "s/\/.*//" | sort -u | anew $dir/$1_subdomains;
	echo "jdlc"
	curl -s "https://jldc.me/anubis/subdomains/$1" | grep -Po "((http|https):\/\/)?(([\w.-]*)\.([\w]*)\.([A-z]))\w+" | sort -u | anew $dir/$1_subdomains;
	echo "sonar"
	curl --silent https://sonar.omnisint.io/subdomains/$1  | grep -oE "[a-zA-Z0-9._-]+\.twitter.com" | sort -u | anew $dir/$1_subdomains;
	#add more oneliners like the one above if you find more :)
fi
