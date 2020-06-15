# 前端环境的配置

## 基本工具的安装
- Node.js 的安装 → [官网链接](https://nodejs.org/zh-cn/download/)
- git 的安装 → [下载地址](https://git-scm.com/downloads)
- cnpm || yarn 的安装
> [cnpm淘宝镜像](https://developer.aliyun.com/mirror/NPM?from=tnpm)  
> [yarn下载地址](https://yarn.bootcss.com/docs/install/#windows-stable)  
- vscode 的安装 → [vscode下载地址](https://code.visualstudio.com/)

## 拉取前端git库的代码
- 找相关人员配置git的权限
- git clone [git地址](http://10.168.1.186:8081/lujie/datashow.git) 进行代码拉取
- 需要的话 可以配置ssh
- git checkout develop 切换到develop分支进行开发

## 配置开发环境
- 进入到datashow【项目目录】
- 安装依赖  yarn || npm install || cnpm install  【三种方式自己选择】
- 开发环境  yarn serve || npm run serve || cnpm run serve   【三种方式自己选择】
- 打包 yarn deploy || npm run deploy || cnpm run deploy 【三种方式自己选择】

## 测试环境的部署
- 找相关人员配置jenkins的权限
- 到jenkins进行打包后的文件的部署【存在dist文件夹】【dist里的就是打包后的文件】
- [jenkins的地址](http://10.168.1.186:8082/) 【前端分支：datashow-demo】

