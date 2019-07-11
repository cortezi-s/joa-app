<template>
  <main class="login">
    <div class="columns is-centered is-gapless">
      <div class="column is-3">
        <form @submit.prevent="formSubmitted">
          <div class="login-form-body">
            <b-field label="Usuário" :type="{ 'is-danger': hasError }">
              <b-input v-model="user.username"></b-input>
            </b-field>
            <b-field label="Senha" :type="{ 'is-danger': hasError }" :message="errorMessage">
              <b-input v-model="user.password" type="password"></b-input>
            </b-field>
            <b-field>
              <p class="control">
                <button
                  type="submit"
                  class="button"
                  :class="[
                    'is-primary',
                    'is-fullwidth',
                    { 'is-loading': isSubmitting }
                  ]"
                >
                  <span>
                    Entrar
                  </span>
                </button>
              </p>
            </b-field>
          </div>
        </form>
      </div>
    </div>
  </main>
</template>

<script>
import { pick } from 'lodash'

export default {
  name: 'LoginPage',
  layout: 'blank',
  data() {
    return {
      user: {},
      errorMessage: null,
      hasError: false,
      isSubmitting: false
    }
  },
  methods: {
    formSubmitted() {
      this.sign_in()
    },
    sign_in() {
      this.isSubmitting = true
      this.$axios
        .post('/auth/sign_in', {
          username: this.user.username,
          password: this.user.password
        })
        .then(response => {
          this.isSubmitting = false
          const authHeaders = pick(response.headers, [
            'access-token',
            'client',
            'expiry',
            'uid',
            'token-type'
          ])
          this.$store.commit('auth', authHeaders)

          // response.data.data is an object containing public information about the current user.
          // This is useful to keep track of so that your app can display the current user's
          // email/username somewhere.
          this.$store.commit('user', response.data.data)

          // Write both the response headers and the current user data to the cookie.
          const contents = {
            tokens: authHeaders,
            user: response.data.data
          }

          this.$cookie.set('session', JSON.stringify(contents), {
            expires: '14D'
          })

          // Go home or wherever the user originally wanted to go
          this.$router.push({ name: 'admin-collaborator' })
        })
      .catch(error => {
        this.isSubmitting = false
        this.hasError = true
        this.errorMessage = error.response.data.errors[0]
      })
    }
  }
}
</script>

<style>
body {
  background-color: #f9f9f9;
  height: 100vh;
}

.login-form-body {
  padding: 20px;
  background-color: white;
  border: solid #d8dee2 1px;
  border-radius: 5px;
}
</style>
