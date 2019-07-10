<template>
  <div class="container has-text-centered error">
    <h2 v-if="error.statusCode === 404">Página não encontrada</h2>
    <h2 v-else>Oops, ocorreu algum erro</h2>
    <nuxt-link to="/" class="has-text-link">Ir para a página inicial -></nuxt-link>
  </div>
</template>

<script>
export default {
  props: ['error']
}
</script>

<style lang="scss" scoped>
  .error {
    padding-top: 5rem;
  }
</style>