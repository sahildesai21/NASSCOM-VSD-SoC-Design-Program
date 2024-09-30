mkdir -p work/tools
mv qrouter-1.4.59.tgz work/tools/.
mv magic-8.2.172.tgz work/tools/.
mv netgen-1.5.134.tgz work/tools/.
mv qflow-1.3.17.tgz work/tools/.
cd work/tools
 apt-get install build-essential bison flex \
	libreadline-dev gawk tcl-dev tk-dev libffi-dev git \
	graphviz xdot pkg-config python3 --assume-yes
 apt install libglu1-mesa-dev freeglut3-dev --assume-yes
wget "https://github.com/Kitware/CMake/releases/download/v3.13.0/cmake-3.13.0.tar.gz"
tar -xvzf cmake-3.13.0.tar.gz
cd cmake-3.13.0/
 ./bootstrap --prefix=/usr/local
 make -j$(nproc)
 make install 
cd ../
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key |  apt-key add -
 apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-6.0 main" -y 
 apt-get update 
 apt-get install -y clang-6.0 --assume-yes
 apt-get install gsl-bin libgsl0-dev --assume-yes
 add-apt-repository ppa:saltmakrell/ppa -y 
 apt-get update
# apt-get install yosys --assume-yes
git clone https://github.com/rubund/graywolf.git
cd graywolf/
mkdir build
cd build
cmake ..
 make
 make install
cd ../../
tar -xvzf qrouter-1.4.59.tgz
cd qrouter-1.4.59
#git clone git://opencircuitdesign.com/qrouter-1.4 
#cd qrouter-1.4/
 ./configure 
 make
 make install 
cd ../
 apt-get install m4 --assume-yes
 apt-get install libx11-dev --assume-yes
 apt-get install tcsh --assume-yes
 apt-get install tclsh --assume-yes
# apt-get install magic --assume-yes

 wget "http://opencircuitdesign.com/magic/archive/magic-8.3.50.tgz"
tar -xvzf magic-8.3.50.tgz
cd magic-8.3.50
#tar -xvzf magic-8.2.172.tgz
#cd magic-8.2.172
#git clone git://opencircuitdesign.com/netgen-1.5 
#cd netgen-1.5/
 ./configure
 make
 make install
cd ../

tar -xvzf netgen-1.5.134.tgz
cd netgen-1.5.134
#git clone git://opencircuitdesign.com/netgen-1.5 
#cd netgen-1.5/
 ./configure 
 make
 make install
cd ../
tar -xvzf qflow-1.3.17.tgz
cd qflow-1.3.17
#git clone git://opencircuitdesign.com/qflow-1.3 
#cd qflow-1.3/
 ./configure 
 make
 make install
 apt-get install autoconf --assume-yes
 apt-get install automake --assume-yes
 apt-get install libtool --assume-yes
 apt-get install swig --assume-yes
cd ../
#git clone https://github.com/abk-openroad/OpenSTA.git
#cd OpenSTA/
# ./bootstrap 
# ./configure 
# make
git clone https://github.com/The-OpenROAD-Project/OpenSTA.git
cd OpenSTA
mkdir build
cd build
cmake ..
make
cd ../
 ln -s $PWD/app/sta /usr/bin/sta
cd ../
 apt-get install tcllib --assume-yes

 add-apt-repository ppa:ubuntu-toolchain-r/test -y
 apt-get update
 apt-get install gcc-8 g++-8 --assume-yes
cd /usr/bin
 rm -rf g++
 ln -s g++-8 /usr/bin/g++
 rm -rf gcc
 ln -s gcc-8 /usr/bin/gcc
cd -
 apt-get install iverilog
 apt-get install gtkwave
#git clone https://github.com/OpenTimer/OpenTimer.git
#cd OpenTimer/
#mkdir build
#cd build
#cmake ../
# make
#cd ../
# ln -s $PWD/bin/ot-shell /usr/bin/OpenTimer
cd ../../


