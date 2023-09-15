# FPGA
some code for learning  FPGA.

#### 如何使用

- 需要安装**vivado**，并且把**vivado**的**bin**目录添加到环境变量**PATH**当中
- 安装**make**，或者其他的方便编译的工具。

#### 目录结构

- **doc**里面放了一些关于编程的理解点，都是点，很碎，但是只有点都通了，才能很流畅的进行这个过程
- **script**里面放了一些方便使用的函数，一般和vivado创建工程，综合仿真有关，电脑多版本vivado的时候切换版本
- **lib**里面放一些verilog编程代码，可复用的模块，还有可以通用的xdc文件
- **project**里面就是放置了生成工程的make文件
- **board**里面就放了一些和板级有关的xdc文件

#### 编程目标

- [ ] UART
- [ ] SPI
- [ ] IIC
