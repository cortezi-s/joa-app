<template>
  <div class="box">
    <form @submit.prevent="formSubmitted">
      <b-field label="Título">
        <b-input v-model="article.title" :disabled="successSubmit"> </b-input>
      </b-field>
      <b-field label="Fonte">
        <b-input v-model="article.source" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field label="Link">
        <b-input v-model="article.link" :disabled="successSubmit">
        </b-input>
      </b-field>
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
export default {
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
      await this.$axios.$post('/api/v1/admin/articles', {
        article: this.article
      })
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    },
    async editArticle() {
      this.isSubmitting = true
      await this.$axios.$patch(`/api/v1/admin/articles/${this.article.id}`, {
        article: this.article
      })
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    }
  }
}
</script>
