<template>
  <div id="institucional">
    <section class="section">
      <div class="container">
        <div class="is-inline-block mt">
          <div class="titleDiv">
            <div>
              <h2>Comitês</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>

        <div class="columns is-multiline is-variable is-8">
          <div class="column is-half">
            <h3>{{ comiteSection1.title }}</h3>
            <p v-html="comiteSection1.content" class="text has-text-justified"></p>
          </div>
          <div class="column is-half">
            <h3>{{ comiteSection2.title }}</h3>
            <p v-html="comiteSection2.content" class="text has-text-justified"></p>
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
      comiteSection1: {},
      comiteSection2: {}
    }
  },
  created() {
    this.$axios.$get('/api/v1/sections/comite-1').then(response => {
      this.comiteSection1 = response
    })
    this.$axios.$get('/api/v1/sections/comite-2').then(response => {
      this.comiteSection2 = response
    })
  }
}
</script>

<style lang="scss" scoped>
  h3 {
    padding-bottom: 20px;
  }
</style>