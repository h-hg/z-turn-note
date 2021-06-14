# 概念

## Latex 与 Tex

Tex 是一个排版引擎。后面有人开发出了 e-Tex（Extended-Tex），使得原版的 Tex 被当作太上皇，几乎所有后续的 Tex 引擎都是基于 e-Tex 开发的。

Latex 是一种使用 tex 程序作为排版引擎得格式，可以粗略地将它理解成是对 Tex 的一层封装。最初的设计目标是内容与格式的分离。

Latex 当前的版本是 Latex2ε 表示超出了第二版，但是远达不到第三版，也写作 Latex2e

## 引擎

可以理解为编译器，将源代码编译为文档。

- latex
- pdflatex
- xelatex
- lunlatex

## 格式

格式是在引擎的基础上，通过云定义一系列宏，来实现一种 Tex 编写模式和规范。简单说就是编程语言的语法规范。

## 驱动

在 Latex 编译成文档时，还可能会用到一些必要的驱动软件，如将 dvi 文件转化为 pdf 文件的如按年，如 dvipdf、dvipdfm、dvipdfmx、xdivpdfmx 等。

## 宏包

别人通过宏指令集造的轮子，一般直接拿来用就行。


## 编辑器

给用户提供编写 Latex 的软件。

- Texworks
- Texstudio
- TexShop

## 发行版

将引擎、格式、宏包、驱动等等东西打包到一起就成了发行版，用户一般安装的就是发行版

- TexLive
- MikTex
- MacTex


## 文件格式

源文件

- .sty：宏包文件
- .cls：文档类文件
- .bib：bibtex 参考文献的数据库
- .bst：bibtex 参考文献的格式模板

中间文件

- .log： 排版引擎生成的日志文件，供排查错误使用。
- .lo.aux： LATEX 生成的主辅助文件，记录交叉引用、目录、参考文献的引用等。
- .lo.toc： LATEX 生成的目录记录文件。
- .lo.lof： LATEX 生成的图片目录记录文件。
- .lo.lot： LATEX 生成的表格目录记录文件。
- .lo.bbl： BIBTEX 生成的参考文献记录文件。
- .lo.blg： BIBTEX 生成的日志文件。
- .lo.idx： LATEX 生成的供 makeindex 处理的索引记录文件。
- .lo.ind： makeindex 处理 .idx 生成的用于排版的格式化索引文件。
- .lo.ilg： makeindex 生成的日志文件。
- .lo.out： hyperref 宏包生成的 PDF 书签记录文件。
