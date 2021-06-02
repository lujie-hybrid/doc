# 项目说明

## 一级目录

| 目录路径        |                      说明                       | 层级 |
| --------------- | :---------------------------------------------: | ---: |
| vue.config.js   |                 vue 的配置文件                  |    1 |
| package.json    |        包信息文件(依赖包和指令 scripts)         |    1 |
| babel.config.js |                babel 的配置文件                 |    1 |
| .gitignore      |             git 提交的忽略文件配置              |    1 |
| .eslintignore   |                eslint 忽略的配置                |    1 |
| .eslintrc.js    |                eslint 的配置文件                |    1 |
| public          | 纯粹静态文件夹目录，此目录不走 webpack 资源分析 |    1 |
| dist            |          打包文件夹,里面是打包后的文件          |    1 |
| node_modules    |        依赖的文件，一般安装依赖后就会有         |    1 |
| src             |                业务开发文件目录                 |    1 |

## 二级目录

| 目录路径                  |                                          说明                                           | 层级&nbsp; &nbsp; |
| ------------------------- | :-------------------------------------------------------------------------------------: | ----------------: |
| src/api                   |                               原 jeecg 框架接口 api 目录                                |                 2 |
| src/assets                |           原 jeecg 框架静态资源目录(图片+less)，这里面的会走 webpack 资源分析           |                 2 |
| src/components            | 原 jeecg 框架组件目录，需要关注的是里面的 dict/JDictSelectTag.vue 和 layouts,目前用到过 |                 2 |
| src/components/dict       |                  原 jeecg 框架字典的一些组件(JDictSelectTag 已经用到)                   |
| src/components/layouts    |                       原 jeecg 框架路由中有 children 的父级的模板                       |
| src/config                |                           原 jeecg 框架一些全局变量和路由常量                           |                 2 |
| src/mixins                |                                     ajax 的封装目录                                     |                 2 |
| src/router                |                                     路由定义的地方                                      |                 2 |
| src/sass【重点】          |               sass 系统的目录(包括 assets，components，mock，scss，utils)               |                 2 |
| src/store【重点】         |         vuex 状态管理目录(原 jeecg 框架里面有一些逻辑，后期状态机制也是在这里)          |                 2 |
| src/utils                 |                               原 jeecg 框架通用工具/方法                                |                 2 |
| src/views                 |                                  原 jeecg 框架页面目录                                  |                 2 |
| src/views/sass【重点】    |                                   sass 系统的页面目录                                   |                 2 |
| src/App.vue               |                                      项目的主页面                                       |                 2 |
| src/main.js【重点】       |                      项目的主入口文件，包含了众多配置的引入和使用                       |                 2 |
| src/permission.js【重点】 |                                项目的权限路由的控制文件                                 |                 2 |

## sass 目录

| 目录路径                          |                                                 说明                                                 |
| --------------------------------- | :--------------------------------------------------------------------------------------------------: |
| sass/api                          |              api 模块的自动注入，用的是 vue install 的插件形式，里面是具体项目模块的 js              |
| sass/assets/font                  |                                           项目中用到的字体                                           |
| sass/assets/images                |                             本地图片全放在这里，业务模块在里面自行建目录                             |
| sass/components                   |                                   组件目录,具体业务模块自行建目录                                    |
| sass/components/common            |                                             通用组件目录                                             |
| sass/mock                         |                                            引入了 mockjs                                             |
| sass/scss                         | scss 目录, reset.scss 是初始化样式，ele.scss 是覆盖 elementui 主题的文件，common.scss 是通用全局样式 |
| sass/utils                        |                                             通用工具目录                                             |
| sass/utils/common.js              |                                             通用方法封装                                             |
| sass/utils/filter.js              |                                              全局过滤器                                              |
| sass/utils/reg.js                 |                                            正则的判断封装                                            |
| sass/utils/multiRequireContext.js |                              自动注入的文件【可以不看，业务开发不涉及】                              |
| sass/utils/elementui.js           |                                           elementui 的引入                                           |

#### <font color=red>说明：后面会对项目进行瘦身，原 jeecg 的很多文件要删掉，不过整体目录结构基本不变，不会影响业务开发</font>

## 功能点

1. 别名 alias, 用于路径的 import 引入，比如 import xxx from "@sass/utils/filter"

```js
config.resolve.alias
  .set('@$', resolve('src'))
  .set('@api', resolve('src/api'))
  .set('@assets', resolve('src/assets'))
  .set('@comp', resolve('src/components'))
  .set('@views', resolve('src/views'))
  .set('@sass', resolve('src/sass'))
  .set('@com', resolve('src/sass/components'));
```

1. @com/common 里面的通用组件的用法

```js
// 比如 CommonTable.vue
使用： <sass-common-table></sass-common-table>
```

2. api 自动注入
   > @sass/api/\* 已经对接口进行了自动注入，绑定到 <font color=red>Vue.prototype.\$sa</font> 上  
   > 使用方法如下：

```js
this.$sa.文件名.方法名().then(()=>{...});

// 实例
// this.$sa.pm.getList其实就是导出方法的引用
getData() {
  let { page, size } = this.pageInfo
  this.pageInfo.loading = true
  this.$sa.pm
    .getList({
      pageNo: page,
      pageSize: size,
      condition: this.searchCont,
      projectPhase: setAllCode(this.projectPhase),
      industryCode: setAllCode(this.industryCode),
      projectType: this.formVal.orderType,
      payStatus: this.formVal.payStatus,
    })
    .then((res) => {
      console.log(res, 'res')
      this.pageInfo.loading = false
      this.pageInfo.total = res.result.total
      this.tableData = res.result.records
    })
},
```

#### 原理就是：api/\*.js 里面每个 js 文件 export 导出的方法，整体绑定一个{}的 key 上，key 的名字就是文件名，然后将这个{}赋值给 Vue.prototype.\$sa

<!-- ## 功能说明
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
>  - 参数说明：successFn是成功的回调函数,传入接口的数据res，config是配置的参数，针对的有<font color=green>**type,data,multi,headers**</font>四个常用配置 -->
