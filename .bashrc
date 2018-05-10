# .bashrc
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

export PATH=/package/cmake-3.7.2/bin:$PATH
export PATH=/package/gcc-7.2.0/bin:$PATH
export PATH=/package/clang-5.0.1/bin:$PATH
export PATH=/package/binutils-2.28/bin:$PATH
export PATH=/usr/lib64/ccache:$PATH
export PATH=~/.local/bin:$PATH
export LD_LIBRARY_PATH=/package/gcc-7.2.0/lib64:$LD_LIBRARY_PATH

export QUARTUS_ROOT_DIR=~/intelFPGA/16.1
export PATH=$QUARTUS_ROOTDIR/nios2eds:$QUARTUS_ROOTDIR/quartus/bin:$QUARTUS_ROOTDIR/quartus_sopcbuilder/bin:$PATH


export CXX=g++
export CC=gcc

# Set Shell to be zsh leave this line last so exports etc get properly set.
if [[ $- == *H* ]]; then
    export SHELL=/bin/zsh
    exec /bin/zsh -l
fi


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export ALTERAOCLSDKROOT="/home/winnt/TIBRA/james.anastasiou/intelFPGA/16.1/hld"

export QSYS_ROOTDIR="/home/winnt/TIBRA/james.anastasiou/intelFPGA/16.1/quartus/sopc_builder/bin"
alias config='/usr/bin/git --git-dir=/home/winnt/TIBRA/james.anastasiou/.cfg/ --work-tree=/home/winnt/TIBRA/james.anastasiou'
