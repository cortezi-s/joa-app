<template>
  <div>
    <div class="box">
      <nav class="level">
        <div class="level-left">
          <div class="level-item">
            <p class="title is-size-2">Colaboradores</p>
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
      :collaborator="editCollaborator"
      @edit:collaborator="editButtonHandler($event)"
    >
    </component>
  </div>
</template>

<script>
import CollaboratorForm from '~/components/CollaboratorForm'
import CollaboratorList from '~/components/CollaboratorList'

export default {
  name: 'CollaboratorAdmin',
  components: {
    CollaboratorForm,
    CollaboratorList
  },
  data() {
    return {
      currentTabComponent: 'CollaboratorList',
      formIsCurrentTab: false,
      editCollaborator: {}
    }
  },
  methods: {
    createButtonHandler() {
      this.editCollaborator = {}
      this.formIsCurrentTab = true
      this.currentTabComponent = 'CollaboratorForm'
    },
    showButtonHandler() {
      this.currentTabComponent = 'CollaboratorList'
      this.formIsCurrentTab = false
    },
    editButtonHandler(collaborator) {
      this.formIsCurrentTab = true
      this.currentTabComponent = 'CollaboratorForm'
      this.editCollaborator = collaborator
    }
  }
}
</script>
