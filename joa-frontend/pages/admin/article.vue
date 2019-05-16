<template>
  <div>
    <div class="box">
      <nav class="level">
        <div class="level-left">
          <div class="level-item">
            <p class="title is-size-2">Artigos</p>
          </div>
        </div>
        <div class="level-right">
          <div class="level-item">
            <b-button
              v-if="formIsCurrentTab"
              type="is-warning"
              @click="showButtonHandler"
            >
              Ver Lista
            </b-button>
          </div>
          <div class="level-item">
            <b-button
              v-if="!formIsCurrentTab"
              type="is-success"
              icon-left="plus"
              @click="createButtonHandler"
            >
              Criar novo
            </b-button>
          </div>
        </div>
      </nav>
    </div>
    <component
      :is="currentTabComponent"
      :article="editArticle"
      @edit:article="editButtonHandler($event)"
    >
    </component>
  </div>
</template>

<script>
import ArticleForm from '~/components/ArticleForm'
import ArticleList from '~/components/ArticleList'

export default {
  components: {
    ArticleForm,
    ArticleList
  },
  data() {
    return {
      currentTabComponent: 'ArticleList',
      formIsCurrentTab: false,
      editArticle: {}
    }
  },
  methods: {
    createButtonHandler() {
      this.editArticle = {}
      this.formIsCurrentTab = true
      this.currentTabComponent = 'ArticleForm'
    },
    showButtonHandler() {
      this.currentTabComponent = 'ArticleList'
      this.formIsCurrentTab = false
    },
    editButtonHandler(article) {
      this.formIsCurrentTab = true
      this.currentTabComponent = 'ArticleForm'
      this.editArticle = article
    }
  }
}
</script>
