# syntax=docker/dockerfile:1
FROM sycldocker-ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3

# install level zero
RUN wget https://github.com/oneapi-src/level-zero/releases/download/v1.2.3/level-zero-devel_1.2.3+u18.04_amd64.deb
RUN wget https://github.com/oneapi-src/level-zero/releases/download/v1.2.3/level-zero_1.2.3+u18.04_amd64.deb
RUN sudo dpkg -i ./level-zero*
RUN rm level-zero-devel_1.2.3+u18.04_amd64.deb
RUN rm level-zero_1.2.3+u18.04_amd64.deb

RUN mkdir compilers_gits
RUN mkdir compilers


###################################
## DPC++ (requirement)
###################################
#update cmake
RUN sudo apt-get update
RUN sudo apt-get install -y ca-certificates gpg wget
RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /usr/share/keyrings/kitware-archive-keyring.gpg >/dev/null
RUN echo 'deb [signed-by=/usr/share/keyrings/kitware-archive-keyring.gpg] https://apt.kitware.com/ubuntu/ focal main' | sudo tee /etc/apt/sources.list.d/kitware.list >/dev/null
RUN sudo apt-get update
RUN sudo rm /usr/share/keyrings/kitware-archive-keyring.gpg
RUN sudo apt-get install -y kitware-archive-keyring
RUN sudo apt-get update
RUN sudo apt-get install -y cmake

#esimd requirement
RUN sudo apt install -y libva-dev libffi-dev libtool

#OpenCL requirement
RUN sudo apt install -y clinfo intel-opencl-icd opencl-headers

#check clinfo
RUN clinfo



###################################
## DPC++
###################################
WORKDIR /home/docker/compilers_gits

RUN git clone https://github.com/intel/llvm -b sycl

WORKDIR /home/docker/compilers_gits/llvm

# configure dpcpp
RUN CUDA_LIB_PATH=~/opt/cuda/lib64/stubs \
        python3 buildbot/configure.py \
        --llvm-external-projects compiler-rt \
            --cuda \
            --hip \
            --enable-esimd-emulator \
            --enable-plugin native_cpu \
            --cmake-opt="-DCMAKE_INSTALL_PREFIX=/home/docker/compilers/DPCPP" \
            --cmake-opt="-DCUDA_TOOLKIT_ROOT_DIR=~/opt/cuda" \
            --cmake-opt="-DSYCL_BUILD_PI_HIP_ROCM_DIR=/opt/rocm"

WORKDIR /home/docker/compilers_gits/llvm/build

RUN ninja all tools/libdevice/libsycldevice
RUN ninja install

WORKDIR /home/docker/compilers_gits
RUN rm -r llvm

###################################
## Opensycl
###################################
WORKDIR /home/docker/compilers_gits

RUN git clone --recurse-submodules https://github.com/OpenSYCL/OpenSYCL.git

WORKDIR /home/docker/compilers_gits/OpenSYCL

RUN cmake -G Ninja \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++-15 \
        -DCLANG_EXECUTABLE_PATH=/usr/bin/clang++-15 \
        -DLLVM_DIR=/usr/lib/llvm-15/cmake \
        -DWITH_CUDA_BACKEND=ON -DWITH_ROCM_BACKEND=ON \
        -DWITH_LEVEL_ZERO_BACKEND=On \
        -DCUDA_TOOLKIT_ROOT_DIR=~/opt/cuda \
        -DROCM_PATH=/opt/rocm \
        -DCMAKE_INSTALL_PREFIX=/home/docker/compilers/OpenSYCL_clang15 \
        -B build_clang15

WORKDIR /home/docker/compilers_gits/OpenSYCL/build_clang15
RUN ninja install





WORKDIR /home/docker

RUN rm -rf compilers_gits
