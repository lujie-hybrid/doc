# 前端开发工具 VsCode

## 安装的插件

- Auto Close Tag
- Auto Rename Tag
- ESLint
- koroFileHeader(用于注释)
- Prettier
- Vetur
- Path Intellisense (配合下面 jsconfig.json)

```js
// jsconfig.json // 用于识别@sass这种别名，进行路径智能提示
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "@/*": ["src/*"],
      "@sass/*": ["src/sass/*"],
      "@com/*": ["src/sass/components/*"]
    },
    "target": "ES6",
    "module": "commonjs",
    "allowSyntheticDefaultImports": true
  },
  "include": ["src/**/*"],
  "exclude": ["node_modules", "dist"]
}

```

## koroFileHeader 的配置

> 打开文件 → 首选项 → 设置 → 搜索 fileheader → 在下面的 setting.json 里面随便点击进入一个 → 下面 json 里面的配置，进行替换和添加

```js
{
  // 文件头部注释
  "fileheader.customMade": {
    "Date": "Do not edit",
    "FilePath": "Do not edit",
    "描述": "",
    "编辑者": "[your name]"
  },
  //函数注释
  "fileheader.cursorMode": {
    "Date": "Do not edit",
    "描述": "",
    "参数": "",
    "编辑者": "[your name]",
    "返回值": ""
  },
}
```

![setting配置](../images/temp.jpg)

- 使用方法：
  > <font color=green>**ctrl+alt+i**</font> 是头部注释，对应上面的 fileheader.customMade  
  > <font color=green>**ctrl+alt+t**</font> 是函数注释，对应上面的 fileheader.cursorMode

## 代码段 的配置 vue.json

> 打开文件 → 首选项 → 用户片段 → 搜索 vue → 在下面的 vue.json 进入加入要编辑的代码片段。  
> 代码片段去 [该网站](https://snippet-generator.app/) 转化，需要的是转化后的 body 里面的。

```vue
// 左边是要转化的代码，如下面

<template>
  <div></div>
</template>

<script>
export default {
  components: {},
  data() {
    return {};
  },
  methods: {},
};
</script>

<style lang="scss" scoped></style>
```

```js

转化后：

"": {
  "prefix": "",
  "body": [
    "<template>",
    "  <div></div>",
    "</template>",
    "",
    "<script>",
    "export default {",
    "  components: {},",
    "  data() {",
    "    return {};",
    "  },",
    "  methods: {},",
    "};",
    "</script>",
    "",
    "<style lang=\"scss\" scoped></style>"
  ],
  "description": ""
}
```

```json
// vue.json 下面的指令就是lvue，会自动生成代码

{
  // Place your snippets for vue here. Each snippet is defined under a snippet name and has a prefix, body and
  // description. The prefix is what is used to trigger the snippet and the body will be expanded and inserted. Possible variables are:
  // $1, $2 for tab stops, $0 for the final cursor position, and ${1:label}, ${2:another} for placeholders. Placeholders with the
  // same ids are connected.
  // Example:
  "lvue": {
    "prefix": "lvue",
    "body": [
      "<template>",
      "  <div></div>",
      "</template>",
      "",
      "<script>",
      "export default {",
      "  components: {},",
      "  data() {",
      "    return {}",
      "  },",
      "  methods: {},",
      "}",
      "</script>",
      "",
      "<style lang=\"scss\" scoped></style>"
    ],
    "description": "lvue base"
  }
}
```
