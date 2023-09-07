# syntax=docker/dockerfile:1
FROM sycldocker-ubuntu20.04

COPY scripts/install_cuda11.0.2.sh /opt/src/scripts/install_cuda11.0.2.sh
COPY scripts/install_llvm15.sh /opt/src/scripts/install_llvm15.sh
COPY scripts/install_rocm.5.4.3.sh /opt/src/scripts/install_rocm.5.4.3.sh

RUN sh /opt/src/scripts/install_llvm15.sh
RUN sh /opt/src/scripts/install_cuda11.0.2.sh
RUN sh /opt/src/scripts/install_rocm.5.4.3.sh