<template>
  <div class="box">
    <p class="title is-size-2">Artigos</p>
    <form @submit.prevent="addArticle">
      <b-field label="Título">
        <b-input v-model="newArticle.title"></b-input>
      </b-field>
      <b-field label="Subtítulo">
        <b-input v-model="newArticle.subtitle"></b-input>
      </b-field>
      <VueTrix v-model="newArticle.content" />
      <b-field></b-field>
      <b-field>
        <p class="control">
          <button type="submit" class="button is-primary">
            Salvar
          </button>
        </p>
      </b-field>
    </form>
  </div>
</template>

<script>
import VueTrix from 'vue-trix'

export default {
  name: 'ArticleAdmin',
  components: {
    VueTrix
  },
  data() {
    return {
      newArticle: {}
    }
  },
  methods: {
    async addArticle() {
      const result = await this.$axios.$post('articles', {
        article: this.newArticle
      })
      console.log(result)
    }
  }
}
</script>
