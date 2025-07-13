# XSS Labs - 漏洞靶场

这是一个用于学习和测试跨站脚本攻击（XSS）漏洞的 PHP 漏洞靶场项目。  
通过本项目，你可以快速搭建起一个带有反射型 XSS 漏洞的测试环境，方便安全研究和漏洞演练。


## 功能特点

- 简单易用的反射型 XSS 演示页面
- 基于 PHP + Apache 官方镜像构建
- 支持 Docker 一键构建和运行
- 适合安全学习、渗透测试和教学演示


## 快速开始

### 1. 本地构建镜像

```bash
docker build . -t xss-labs:latest
```

### 2. 运行容器

```bash
docker run -d -p 8080:80 xss-labs
```

### 3. 访问靶场

打开浏览器访问以下地址，进行测试：

```bash
http://localhost:8080/index.php
```

## 直接使用预构建镜像

如果不想本地构建镜像，可以直接拉取我们预先构建好的镜像：

```bash
docker pull y4ney/xss-labs:latest
docker run -d -p 8080:80 y4ney/xss-labs:latest
```

访问地址同上。

## 注意事项

1. 本项目仅用于学习和安全研究，请勿用于非法攻击。

2. 漏洞演示页面存在真实的 XSS 漏洞，请勿将镜像暴露到公网环境。

3. 建议在安全隔离的本地或测试环境中使用。

4. 如果需要添加更多漏洞示例，可以自行扩展代码。

欢迎反馈和贡献，祝你学习愉快！

## 联系方式

- 项目维护者：Yaney
- 邮箱：yangli.yaney@gmail.com
- GitHub：<https://github.com/y4ney/xss-labs>
