const pkg = require('./package')

module.exports = {
  mode: 'universal',

  /*
   ** Server configuration
   */
  server: {
    host: 'localhost',
    port: 8080
  },

  /*
   ** Headers of the page
   */
  head: {
    title: 'Joa Assessoria',
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: 'Buscamos negócios inovadores visando a geração de valor ao longo prazo' }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/icon.ico' }]
  },

  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },

  /*
   ** Global CSS
   */
  css: [
    'assets/scss/custom.scss',
    'aos/dist/aos.css'
  ],

  /*
   ** Plugins to load before mounting the App
   */
  plugins: [
    '~/plugins/axios',
    '~/plugins/vue-cookie',
  ],

  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/proxy',
    '@nuxtjs/style-resources',
    ['nuxt-buefy', {
      css: false
    }]
  ],

  /*
   ** Buefy module configuration
   */
  buefy: {
    defaultIconPack: 'fas',
    materialDesignIconsHRef:
      'https://use.fontawesome.com/releases/v5.4.1/css/all.css'
  },

  /*
   ** Axios module configuration
   */
  axios: {
    debug: true,
    proxy: true
  },

  /*
   ** Axios proxy module configuration
   */
  proxy: {
    '/api/v1/': 'http://localhost:3000',
    '/auth/': 'http://localhost:3000',
    '/contact': 'http://localhost:3000',
    '/rails/active_storage/': 'https://joacapital.com.br:3000'
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    // extend(config, ctx) {
    //   // Run ESLint on save
    //   if (ctx.isDev && ctx.isClient) {
    //     config.module.rules.push({
    //       enforce: 'pre',
    //       test: /\.(js|vue)$/,
    //       loader: 'eslint-loader',
    //       exclude: /(node_modules)/
    //     })
    //   }
    // }
  }
}
