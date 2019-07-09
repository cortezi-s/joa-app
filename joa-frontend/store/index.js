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
