if grep -E ^ /etc/*-release &> /dev/null; then
    DISTRIB_ID=$(             grep -E ^NAME /etc/*-release 2> /dev/null | cut -f2 -d"=");
    DISTRIB_ID=${DISTRIB_ID:-`grep -E ^DISTRIB_ID /etc/*-release 2> /dev/null | cut -f2 -d"="`};
fi;
DISTRIB_ID=${DISTRIB_ID:-`uname -s`};
DISTRIB_ID=${DISTRIB_ID:-"<unknown>"};

DISTRIB_VERSION=$(         grep -E ^DISTRIB_RELEASE /etc/*-release 2> /dev/null | cut -f2 -d"=");

echo -n "Distribution: $DISTRIB_ID";

if [ $DISTRIB_VERSION ]; then
    echo " ($DISTRIB_VERSION)";
else
    echo;
fi;

echo "Kernel: $(uname -r)";

echo "Searching for package managers";

array=(
    "apt"
    "aptitude"
    "apt-get"
    "dnf"
    "yum"
    "pacman"
    "yay"
    "dpkg"
    "entropy"
    "flatpak"
    "snap"
    "brew"
    "nix"
    "emerge"
    "apk"
    "zypper"
    "xbps"
);
for element in "${array[@]}";
do
    if [ $(which $element 2> /dev/null) ]; then
        echo "Package manager: $element ($(which $element))";
    fi
done