# ML Env

```bash
conda create -n ml python=3.8
```

```bash
conda install -c conda-forge jupyterlab
conda install tensorflow
conda install -c conda-forge scikit-learn
conda install matplotlib
# conda install cudatoolkit=11.0 cuDNN=8.0
conda install tensorflow-gpu=2.4.1
```

see https://jupyter.org/install.html

tensorflow-gpu: https://blog.csdn.net/qq_27825451/article/details/89082978

参考 [anaconda tensorflow](https://docs.anaconda.com/anaconda/user-guide/tasks/tensorflow/)

好像直接 `conda install tensorflow-gpu` 就行，它会直接给你安装好 CUDA 和 cuDNN，虽然，好像 CUDA 和 cuDNN 的版本好像跟 tensorflow 官网给的测试版本不一样，但是还是可以正常运行的。
