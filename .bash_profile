# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export ALTERAOCLSDKROOT="/home/winnt/TIBRA/james.anastasiou/intelFPGA/16.1/hld"

export QSYS_ROOTDIR="/home/winnt/TIBRA/james.anastasiou/intelFPGA/16.1/quartus/sopc_builder/bin"
