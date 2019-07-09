export const getters = {
  user: state => state.user,
  auth: state => state.auth
}

export const mutations = {
  user(state, value) {
    state.user = value
  },
  auth(state, value) {
    state.auth = value
  }
}

export const state = () => ({
  user: null,
  auth: {}
})

if (process.client) {
  window.onNuxtReady((app) => {
    const existingSession = app.$cookie.get('session')

    if (existingSession && existingSession.length) { // A string at this point
      const session = JSON.parse(existingSession)
      app.$store.commit('user', session.user)
      app.$store.commit('auth', session.tokens)
    }
  })
}
