# SYCL docker images

This repo is a collection of docker images used in the Shamrock code

## Building the images

```sh
sudo sh build_images.sh
```

## Images 

 - Base image : `sycldocker-ubuntu20.04`
 - Base image + toolkits : `sycldocker-ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3`
 - Full image with compilers : `sycldocker-sycl_ubuntu20.04_llvm15_cuda11.0.2_rocm5.4.3`

