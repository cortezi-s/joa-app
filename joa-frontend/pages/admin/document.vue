<template>
  <div>
    <div class="box">
      <nav class="level">
        <div class="level-left">
          <div class="level-item">
            <p class="title is-size-2">Documentos</p>
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
      :doc="editDocument"
      @edit:document="editButtonHandler($event)"
    >
    </component>
  </div>
</template>

<script>
import DocumentForm from '~/components/DocumentForm'
import DocumentList from '~/components/DocumentList'

export default {
  name: 'DocumentAdmin',
  layout: 'admin',
  components: {
    DocumentForm,
    DocumentList
  },
  data() {
    return {
      currentTabComponent: 'DocumentList',
      formIsCurrentTab: false,
      editDocument: {}
    }
  },
  methods: {
    createButtonHandler() {
      this.editDocument = {}
      this.formIsCurrentTab = true
      this.currentTabComponent = 'DocumentForm'
    },
    showButtonHandler() {
      this.currentTabComponent = 'DocumentList'
      this.formIsCurrentTab = false
    },
    editButtonHandler(doc) {
      this.formIsCurrentTab = true
      this.currentTabComponent = 'DocumentForm'
      this.editDocument = doc
    }
  }
}
</script>
