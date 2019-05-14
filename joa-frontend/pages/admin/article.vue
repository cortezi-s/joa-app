<template>
  <div class="box">
    <p class="title is-size-2">Artigos</p>
    <form @submit.prevent="addArticle">
      <b-field label="Título">
        <b-input v-model="newArticle.title" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field label="Subtítulo">
        <b-input v-model="newArticle.subtitle" :disabled="successSubmit">
        </b-input>
      </b-field>
      <VueTrix v-model="newArticle.content" />
      <b-field></b-field>
      <b-field>
        <p class="control">
          <button
            type="submit"
            class="button"
            :class="{
              'is-primary': !successSubmit,
              'is-success': successSubmit,
              'is-loading': isSubmitting
            }"
            :disabled="successSubmit"
          >
            <span v-if="successSubmit" class="icon is-small">
              <i class="fas fa-check"></i>
            </span>
            <span>
              {{ submitText }}
            </span>
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
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar',
      newArticle: {}
    }
  },
  methods: {
    async addArticle() {
      this.isSubmitting = true
      const result = await this.$axios.$post('articles', {
        article: this.newArticle
      })
      const trixEditor = document.querySelector('trix-editor')
      trixEditor.setAttribute('contentEditable', 'false')
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
      console.log(result)
    }
  }
}
</script>
