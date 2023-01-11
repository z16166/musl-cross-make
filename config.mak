TARGET =  x86_64-linux-musl
OUTPUT = /opt/cross
STAT = -static --static
FLAG = -g0 -O2 -fno-align-functions -fno-align-jumps -fno-align-loops -fno-align-labels -Wno-error

ifneq ($(NATIVE),)
COMMON_CONFIG += CC="$(HOST)-gcc ${STAT}" CXX="$(HOST)-g++ ${STAT}" FC="$(HOST)-gfortran ${STAT}"
else
COMMON_CONFIG += CC="gcc ${STAT}" CXX="g++ ${STAT}" FC="gfortran ${STAT}"
endif

COMMON_CONFIG += CFLAGS="${FLAG}" CXXFLAGS="${FLAG}" FFLAGS="${FLAG}" LDFLAGS="-s ${STAT}"

BINUTILS_CONFIG += --enable-gold=yes
GCC_CONFIG += --enable-default-pie --enable-static-pie --disable-cet

CONFIG_SUB_REV = 888c8e3d5f7b
GCC_VER = 12.2.0
BINUTILS_VER = 2.37
MUSL_VER = git-f47a8cdd250d9163fcfb39bf4e9d813957c0b187
GMP_VER = 6.2.1
MPC_VER = 1.2.1
MPFR_VER = 4.1.0

LINUX_VER = 5.15.2
