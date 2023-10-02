# SYCL docker images

This repo is a collection of docker images used in the Shamrock code

## Building the images

Image with gits version of sycl compilers : 
```sh
docker build -f images/sycl_gits_versions/Dockerfile.ubuntu20llvm15cuda11rocm543 --tag shamsycl:ubuntu20llvm15cuda11rocm543 .
```
