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
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
  },

  /*
   ** Customize the progress-bar color
   */
  loading: { color: '#fff' },

  /*
   ** Global CSS
   */
  css: [],

  /*
   ** Plugins to load before mounting the App
   */
  plugins: [],

  /*
   ** Nuxt.js modules
   */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/proxy',
    'nuxt-buefy'
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
    prefix: '/api/v1/',
    proxy: true
  },

  /*
   ** Axios proxy module configuration
   */
  proxy: {
    '/api/v1/': 'http://localhost:3000'
  },

  /*
   ** Build configuration
   */
  build: {
    /*
     ** You can extend webpack config here
     */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  }
}
