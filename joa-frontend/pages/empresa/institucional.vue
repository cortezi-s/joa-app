<template>
  <div id="institucional">
    <section class="section">
      <div class="container">
        <div class="is-inline-block">
          <div class="titleDiv">
            <div>
              <h2>{{ institucionalSection.title }}</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>
        <div v-html="institucionalSection.content" class="text has-text-justified"></div>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  data() {
    return {
      institucionalSection: {}
    }
  },
  created() {
    this.$axios.$get('/api/v1/sections/institucional').then(response => {
      this.institucionalSection = response
    })
  }
}
</script>

<style lang="scss" scoped>
  div.text {
    max-width: 960px;
  }
</style>
