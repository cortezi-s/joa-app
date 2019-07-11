<template>
  <div>
    <nav
      class="navbar is-transparent"
      role="navigation"
      aria-label="main navigation"
    >
    <div class="container">
        <div class="navbar-brand">
          <a class="navbar-item" href="/">
            <img src="~/assets/logo-web.svg" alt="Joá Assessoria" width="225" height="45">
          </a>

          <div class="navbar-burger">
            <span />
            <span />
            <span />
          </div>
        </div>
        <div class="navbar-menu">
          <div class="navbar-end">
            <div class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link">
                Sessão
              </a>
              <div class="navbar-dropdown">
                <a class="navbar-item">
                  Alterar a senha
                </a>
                <a class="navbar-item" @click="sign_out">
                  Finalizar sessão
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </nav>

    <section>
      <div class="container">
        <div class="columns main-content is-centered">
          <aside class="column is-3 section">
            <p class="menu-label is-hidden-touch">Gerenciamento</p>
            <ul class="menu-list">
              <li v-for="(item, key) of items" :key="key">
                <nuxt-link :to="item.to" exact-active-class="is-active">
                  <b-icon :icon="item.icon" />
                  {{ item.title }}
                </nuxt-link>
              </li>
            </ul>
          </aside>

          <div class="column is-7 section">
            <nuxt />
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [
        {
          title: 'Colaboradores',
          icon: 'users',
          to: { path: '/admin/collaborator' }
        },
        {
          title: 'Projetos',
          icon: 'medal',
          to: { path: '/admin/project' }
        },
        {
          title: 'Artigos',
          icon: 'newspaper',
          to: { path: '/admin/article' }
        }
      ]
    }
  },
  methods: {
    async sign_out() {
      const authHeaders = this.$store.getters['auth']
      await this.$axios
        .$delete('/auth/sign_out', {
          'access-token': authHeaders['access-token'],
          client: authHeaders['client'],
          uid: authHeaders['uid']
        })
      this.$cookie.delete('session')
      this.$router.push({ name: 'login' })
    }
  }
}
</script>
