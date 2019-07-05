<template>
  <main class="login">
    <div class="columns is-centered is-gapless">
      <div class="column is-3">
        <form>
          <div class="login-form-header">
            <img src="~/assets/icon.svg" width="120" class="logo" />
            <div class="has-text-centered">
              <h1 class="is-size-4 is-size-3">Gerenciamento Website</h1>
            </div>
          </div>
          <div class="login-form-body">
            <b-field label="Usuário">
              <b-input v-model="user.username"></b-input>
            </b-field>
            <b-field label="Senha">
              <b-input v-model="user.password" type="password"></b-input>
            </b-field>
            <b-field>
              <p class="control">
                <button type="submit" class="button is-primary is-fullwidth">
                  Entrar
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
export default {
  name: 'HomePage',
  data() {
    return {
      user: {}
    }
  }
}
</script>

<style>
body {
  background-color: #f9f9f9;
  height: 100vh;
}

.logo {
  display: block;
  margin-left: auto;
  margin-right: auto;
  padding-bottom: 24px;
}

.login-form-header {
  margin-top: 32px;
  margin-bottom: 15px;
}

.login-form-body {
  padding: 20px;
  background-color: white;
  border: solid #d8dee2 1px;
  border-radius: 5px;
}
</style>
