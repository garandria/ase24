FROM tuxmake/x86_64_gcc-10:20230912

RUN apt-get -y update && apt-get install -y \
    time \
    curl \
    libpam0g-dev \
    libgmp-dev libmpfr-dev libmpc-dev locales \
    pipx python3-dev gcc build-essential flex bison bc libssl-dev libelf-dev git \
    wget libz3-java libjson-java sat4j unzip xz-utils lftp && \
    wget -O - https://raw.githubusercontent.com/appleseedlab/superc/master/scripts/install.sh | bash


ENV COMPILER_INSTALL_PATH=$HOME/0day
ENV CLASSPATH=/usr/share/java/org.sat4j.core.jar:/usr/share/java/json-lib.jar:${HOME}/.local/share/superc/z3-4.8.12-x64-glibc-2.31/bin/com.microsoft.z3.jar:${HOME}/.local/share/superc/JavaBDD/javabdd-1.0b2.jar:${HOME}/.local/share/superc/xtc.jar:${HOME}/.local/share/superc/superc.jar:${CLASSPATH}
ENV PATH=${HOME}/.local/bin/:${PATH}

RUN pipx install kmax

# https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/207#issuecomment-557520951
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen


WORKDIR /home
