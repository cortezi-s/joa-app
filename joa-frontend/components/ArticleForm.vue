<template>
  <div class="box">
    <form @submit.prevent="addArticle">
      <b-field label="Título">
        <b-input v-model="article.title" :disabled="successSubmit"> </b-input>
      </b-field>
      <b-field label="Subtítulo">
        <b-input v-model="article.subtitle" :disabled="successSubmit">
        </b-input>
      </b-field>
      <VueTrix v-model="article.content" />
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
  components: {
    VueTrix
  },
  props: {
    article: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar'
    }
  },
  methods: {
    formSubmitted() {
      if (this.article.id) {
        this.editArticle()
      } else {
        this.addArticle()
      }
    },
    async addArticle() {
      this.isSubmitting = true
      await this.$axios.$post('articles', {
        article: this.article
      })
      const trixEditor = document.querySelector('trix-editor')
      trixEditor.setAttribute('contentEditable', 'false')
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    },
    async editArticle() {
      this.isSubmitting = true
      await this.$axios.$patch(`articles/${this.article.id}`, {
        article: this.article
      })
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    }
  }
}
</script>
