<template>
  <div class="box">
    <table class="table is-striped is-fullwidth">
      <thead>
        <tr>
          <th>Título</th>
          <th>Fonte</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="article in articles" :key="article.id" :article="article">
          <td>{{ article.title }}</td>
          <td>{{ article.source }}</td>
          <td>
            <a @click="editArticle(article)">
              <span class="icon">
                <i class="fas fa-edit"></i>
              </span>
            </a>
          </td>
          <td>
            <a @click="removeArticle(article)">
              <span class="icon">
                <i class="fas fa-trash"></i>
              </span>
            </a>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      articles: [],
      actionArticle: {}
    }
  },
  created() {
    this.fetchArticles()
  },
  methods: {
    fetchArticles() {
      this.$axios.$get('/api/v1/admin/articles').then(response => {
        this.articles = response
      })
    },
    editArticle(article) {
      this.$emit('edit:article', article)
    },
    removeArticle(article) {
      this.actionArticle = article
      this.$dialog.confirm({
        title: 'Remover artigo',
        message: 'Tem certeza que você deseja remover esse artigo?',
        confirmText: 'Remover',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: this.deleteArticle
      })
    },
    deleteArticle() {
      this.$axios
        .delete(`/api/v1/admin/articles/${this.actionArticle.id}`)
        .then(response => {
          if (response.status === 204) {
            this.articles.splice(this.articles.indexOf(this.actionArticle), 1)
          }
        })
    }
  }
}
</script>
