#echo ".bashrc"
#Paths to dependencies
#PATH=/cad2/ece552f/gem5_dependencies/bin:$PATH
#LD_LIBRARY_PATH=/cad2/ece552f/gem5_dependencies/lib:$LD_LIBRARY_PATH
#export PATH
#export LD_LIBRARY_PATH
#Use version 4.6 for g++ and gcc on the ug-machines
#alias g++="g++-4.6"
#alias gcc="gcc-4.6"
#export CXX=g++-4.6
#export CC=gcc-4.6
#Set your terminal to xterm so you do not get $ signs in the paths when building gem5
export TERM=xterm
















alias j="/cad2/ece419s/java/jdk1.6.0/bin/java"
alias vim="gvim"
alias la="ls -Fash --color"
alias ls="ls --color"
cd
function cd {
    builtin cd "$@" && ls -F
    }
#exec csh
