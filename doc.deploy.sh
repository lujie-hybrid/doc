#!/usr/bin/env sh

# 生成静态文件
npm run build

# 进入生成的文件夹
cd .vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME
git init
git add -A
git commit -m '----文档打包----'

git push -f https://github.com/lujie-hybrid/lujie-hybrid.github.io.git master