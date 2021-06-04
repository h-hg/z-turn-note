# CUDA

- NVIDA 显卡驱动：有了显卡驱动，才能正常使用为硬件安装的显卡。[官方下载地址](https://www.nvidia.com/Download)
- CUDA ： NVIDA 推出的 GPU 并行计算框架，只能在 NVIDA 显卡上进并行运算，本质上是一个工具包（CUDA ToolKit），[官方下载地址](https://developer.nvidia.com/cuda-downloads)
- cuDNN是一个SDK，是一个专门用于深度神经网络的软件库，提供了许多计算函数。

简单地说，显卡驱动让系统可以调用显卡（硬件）进行计算，CUDA 使得 GPU 并行计算变得简单，而cuDNN 则是在上面的基础上让深度学习变得简单。

注意点：

- 显卡和显卡驱动具有一一对应的关系
- CUDA 和 NVIDA 显卡驱动并不是一一对应的关系。一个设备上（同一种 NVIDA 显卡驱动）可以安装多种 CUDA 版本，例如 CUDA 9.0、CUDA 10.0、CUDA 11.0 三个版本。
- cuDNN 和 CUDA 没有一一对应的关系，但是具有相关性，一个 cuDNN 版本可能与几个 CUDA 版本对应
- 各种深度学习框架，与 CUDA 和 cuDNN 版本具有一定的相关性
  - [Tensorflow](https://www.tensorflow.org/install/source#gpu)

## 参考

- [tensorflow各个版本的CUDA以及Cudnn版本对应关系](https://blog.csdn.net/qq_27825451/article/details/89082978)
- [显卡，显卡驱动,nvcc, cuda driver,cudatoolkit,cudnn到底是什么？](https://zhuanlan.zhihu.com/p/91334380)
