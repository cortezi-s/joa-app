<template>
  <main class="login">
    <div class="columns is-centered is-gapless">
      <div class="column is-3">
        <form @submit.prevent="formSubmitted">
          <div class="form-body">
            <b-field label="Senha atual">
              <b-input v-model="password.current" type="password"></b-input>
            </b-field>
            <b-field label="Nova senha">
              <b-input v-model="password.new" type="password"></b-input>
            </b-field>
            <b-field label="Corfirmação de senha">
              <b-input v-model="password.new_confirmation" type="password"></b-input>
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
                    Alterar senha
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
  name: 'ResetPasswordPage',
  layout: 'blank',
  data() {
    return {
      password: {},
      isSubmitting: false
    }
  },
  methods: {
    formSubmitted() {
      this.password_reset()
    },
    async password_reset() {
      this.isSubmitting = true
      await this.$axios.
        patch('/auth/password', {
          current_password: this.password.current,
          password: this.password.new,
          password_confirmation: this.password.new_confirmation
        })
        .then(response => {
          this.isSubmitting = false
          this.$router.push({ name: 'admin-collaborator' })
          this.$toast.open({
            duration: 5000,
            message: 'Senha alterada com sucesso!',
            type: 'is-info'
          })
        })
        .catch(error => {
          this.isSubmitting = false
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

.form-body {
  padding: 20px;
  background-color: white;
  border: solid #d8dee2 1px;
  border-radius: 5px;
}
</style>
