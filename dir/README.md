# 项目说明

## 一级目录结构  

| 目录路径        | 说明           | 层级  |
| ------------- |:-------------:| -----:|
| vue.config.js      | vue的配置文件 | 1 |
| deploy.js      | 项目的打包js | 1 |
| package.json | 包信息文件(依赖包和指令scripts) | 1 |
| babel.config.js | babel的配置文件 | 1 |
| .gitignore | git提交的忽略文件配置 | 1 |
| .eslintrc.js | eslint的配置文件 | 1 |
| .browserslistrc | 浏览器的兼容配置文件 | 1 |
| public | 纯粹静态文件夹目录，此目录不走webpack资源分析 | 1 |
| dist | 打包文件夹,里面是打包后的文件 | 1 |
| node_modules | 依赖的文件，一般安装依赖后就会有 | 1 |
| src | 业务开发文件目录 | 1 |  


## 二三级目录结构
| 目录路径        | 说明           | 层级&nbsp; &nbsp;  |
| ------------- |:-------------:| -----:|
| src/api | 接口api目录 | 2 |
| src/api/module | 接口api分不同的模块，比如login登录，chart图表，模块目录 | 3 |
| src/assets | 静态资源目录(图片+scss/css)，这里面的会走webpack资源分析 | 2 |
| src/assets/images | 图片目录 | 3 |
| src/assets/scss | 样式目录，此项目用的市sass预处理器 | 3 |
| src/components | 组件目录(全局通用组件目录+其他业务组件目录) | 2 |
| src/components/common | 全局通用组件目录 | 3 |
| src/router | 路由目录 | 2 |
| src/vuex | vuex状态管理目录 | 2 |
| src/utils | 通用工具目录(ajax+echarts+elementui...) | 2 |
| src/utils/server | ajax的封装目录 | 3 |
| src/views | 页面目录 | 2 |
| src/views/chart | 页面嵌套目录，图表，文件夹名用于路由自动注入时嵌套路由的参考 | 3 |  


## 重要文件说明

| 目录路径        | 说明           |
| ------------- |:-------------:| -----:|
| src/api/index.js | api模块的自动注入，用的是vue install的插件形式 |
| src/components/index.js | 针对src/components/common文件夹，vue全局通用组件的自动注入，同样是是vue install的插件形式 |
| src/router/routeOperator.js | 需要在路由里进行的操作的方法的解耦，比如路由导航beforeEach |
| src/store/index.js | vuex状态管理的入口文件 |
| src/utils/server/index.js | ajax封装成型后的导出文件,用于在src/api/index.js里面使用 |
| src/utils/server/ajax.js | axios的原始配置文件 |
| src/utils/charts.js | echarts按需引入的配置文件 |
| src/utils/theme.js | echarts的主题色配置文件 |
| src/utils/common.js | 通用方法文件 |
| src/utils/elementui.js | elementui第三方UI库的按需引入配置文件 |
| src/App.vue | 项目的主页面 |
| src/main.js | 项目的主入口文件，包含了众多配置的引入和使用|  

## 功能说明
<br />

- 路由自动注入
> 在src/views的目录下，二级目录下都需要创建一个 <font color=green>**Layout.vue**</font>，因为二级，三级目录都已经是嵌套视图，自动注入后就是嵌套路由

> <font color=green>**Layout.vue中必须有**</font>&nbsp;```<router-view />```&nbsp;，不清楚的了解下[vue-router](https://router.vuejs.org/zh/guide/essentials/nested-routes.html)
``` js
// Layout.vue
<template>
  <div class="app-wrap">
    <p class="app-title">所有子页面展示的通用信息</p>
    <router-view />
  </div>
</template>
```

> 只要添加.vue文件后就会自动创建路由，比如<font color=blue>**chart/dataManage.vue**</font>,生成后路由path就是<font color=blue>**/chart/datamanage**</font>,name就是<font color=blue>**chart-datamanage**</font>   

<br />

- api的接口化和防止重复提交
> src/utils/server/index.js已经对接口的重复提交做了处理，同一个接口地址，是不能重复提交的，如果需要重复提交，可以在调用时候增加<font color=green>**multi**</font>参数  
> 调用示例如下：
``` js
this.$server.chart.tbTypeData(
        //这个回调函数表示是success后的回调，函数第一个参数是接口的data
        res => {
          //针对接口的数据res进行业务处理
        },
        {
          multi: true, //默认是false，true之后这个接口就可以重复提交
          // 这是data，接口的传入参数，get，post请求都是data
          data: {
            page: current,
            typeId: type,
            title: this.searchMsg ? this.searchMsg : "南通"
          }
        }
      );
```
> 相关说明：
>  - axios封装后的实例赋值给了<font color=green>**Vue.prototype.$server**</font>，所以可以直接用<font color=green>**this.$server**</font>进行引用  
>  - 接口的调用格式：<font color=green>**this.$server.(api/module/*.js的文件的名字).(export default导出的json的key)(successFn,config)**</font>  
>  - api/module/*.js的文件就是各个模块的接口api的js文件，export default导出的json的key(自己定义，但是要看得懂，有意义)，key后面的值就是接口的地址
>  - 参数说明：successFn是成功的回调函数,传入接口的数据res，config是配置的参数，针对的有<font color=green>**type,data,multi,headers**</font>四个常用配置





