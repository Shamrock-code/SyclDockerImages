docker build -f images/ubuntu20.04/Dockerfile --tag sycldocker-ubuntu20.04 .
docker build -f images/ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3/Dockerfile --tag sycldocker-ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3 .
docker build -f images/sycl_ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3/Dockerfile --tag sycldocker-sycl_ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3 .


