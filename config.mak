TARGET =  x86_64-linux-musl

# 编译产物的最终安装目录，固定用这个即可，无需修改。
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

# 2022-10-07号的版本，浏览器的入口是：https://git.savannah.gnu.org/gitweb/?p=config.git;a=summary
CONFIG_SUB_REV = f992bcc08219

GCC_VER = 12.2.0
BINUTILS_VER = 2.37

# 2022-11-30号的版本，浏览器的入口是：https://git.musl-libc.org/cgit/musl/log/
MUSL_VER = git-f47a8cdd250d9163fcfb39bf4e9d813957c0b187

GMP_VER = 6.2.1
MPC_VER = 1.2.1
MPFR_VER = 4.1.0

# UOS专业版目前kernel是这个版本
LINUX_VER = 4.19.0
