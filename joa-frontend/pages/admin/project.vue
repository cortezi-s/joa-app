<template>
  <div>
    <div class="box">
      <nav class="level">
        <div class="level-left">
          <div class="level-item">
            <p class="title is-size-2">Portifólio</p>
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
      :project="editProject"
      @edit:project="editButtonHandler($event)"
    >
    </component>
  </div>
</template>

<script>
import ProjectForm from '~/components/ProjectForm'
import ProjectList from '~/components/ProjectList'

export default {
  name: 'CollaboratorAdmin',
  layout: 'admin',
  components: {
    ProjectForm,
    ProjectList
  },
  data() {
    return {
      currentTabComponent: 'ProjectList',
      formIsCurrentTab: false,
      editProject: {}
    }
  },
  methods: {
    createButtonHandler() {
      this.editProject = {}
      this.formIsCurrentTab = true
      this.currentTabComponent = 'ProjectForm'
    },
    showButtonHandler() {
      this.currentTabComponent = 'ProjectList'
      this.formIsCurrentTab = false
    },
    editButtonHandler(project) {
      this.formIsCurrentTab = true
      this.currentTabComponent = 'ProjectForm'
      this.editProject = project
    }
  }
}
</script>
