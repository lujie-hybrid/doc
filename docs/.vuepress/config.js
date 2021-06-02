module.exports = {
  title: '广告牛前端文档',
  themeConfig: {
    displayAllHeaders: true,
    sidebar: [
      '/',
      '/env/',
      '/standard/',
      "/dir/",
      {
        title: '自定义组件库',
        // path: '/library/',
        collapsable: false, // 可选的, 默认值是 true,
        sidebarDepth: 1,
        children: ['/library/pm/'],
      },
      '/tool/',
    ],
  },
  plugins: ['@vuepress/back-to-top', '@vuepress/medium-zoom'],
};
