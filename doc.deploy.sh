#!/usr/bin/env sh

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME
git init
# git checkout -b main
git add -A
git commit -m '----文档打包----'
# git push -f https://github.com/ggn-web/sass-doc.github.io.git master:gh-pages

git push -f https://github.com/lujie-hybrid/lujie-hybrid.github.io.git master