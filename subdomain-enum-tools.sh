if [ -z "$1" ]
then
	echo "please input the name of the domain"
else
    dir=~/subdomains/$1
  	mkdir -p $dir
    echo "finddomain"
    findomain -t $1 | anew $dir/$1_subdomains;
    echo "knockpy"
    knockpy $1 | anew $dir/$1_subdomains;
    echo "subfinder"
    subfinder -d $1 | anew  $dir/$1_subdomains; 
    echo "assetfinder"
    assetfinder  --subs-only $1  |  anew  $dir/$1_subdomains; 
    echo "subdomanizer"
    subdomainzer -u $1 |  anew  $dir/$1_subdomains; 
    echo "Amass"
    amass enum -d $1 |  anew  $dir/$1_subdomains; 
    
