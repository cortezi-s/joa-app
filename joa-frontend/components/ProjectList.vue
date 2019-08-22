<template>
  <div class="box">
    <table class="table is-striped is-fullwidth">
      <thead>
        <tr>
          <th></th>
          <th>Nome</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <draggable v-model="projects" tag="tbody" handle=".handle" @change="changeListOrder($event)">
        <tr v-for="project in projects" :key="project.id" :project="project">
          <td><i class="fa fa-align-justify handle"></i></td>
          <td>{{ project.company_name }}</td>
          <td>
            <a @click="editProject(project)">
              <span class="icon">
                <i class="fas fa-edit"></i>
              </span>
            </a>
          </td>
          <td>
            <a @click="removeProject(project)">
              <span class="icon">
                <i class="fas fa-trash"></i>
              </span>
            </a>
          </td>
        </tr>
      </draggable>
    </table>
  </div>
</template>

<script>
import draggable from 'vuedraggable'
export default {
  components: {
    draggable,
  },
  data() {
    return {
      projects: [],
      actionProject: {}
    }
  },
  created() {
    this.fetchProjects()
  },
  methods: {
    changeListOrder(e) {
      this.actionProject = e.moved.element
      let newPosition = e.moved.newIndex + 1;
      if(newPosition !== this.actionProject.position) {
        this.actionProject.position = newPosition;
        this.updateProjectPosition()
      }
    },
    updateProjectPosition() {
      this.$axios.$patch(`/api/v1/admin/projects/${this.actionProject.id}`, {
        project: this.actionProject
      })
    },
    fetchProjects() {
      this.$axios.$get('/api/v1/admin/projects').then(response => {
        this.projects = response
      })
    },
    editProject(project) {
      this.$emit('edit:project', project)
    },
    removeProject(project) {
      this.actionProject = project
      this.$dialog.confirm({
        title: 'Remover projeto',
        message: 'Tem certeza que você deseja remover esse projeto?',
        confirmText: 'Remover',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: this.deleteProject
      })
    },
    deleteProject() {
      this.$axios
        .delete(`/api/v1/admin/projects/${this.actionProject.id}`)
        .then(response => {
          if (response.status === 204) {
            this.projects.splice(this.projects.indexOf(this.actionProject), 1)
          }
        })
    }
  }
}
</script>

<style lang="scss" scoped>
.handle {
  cursor: pointer;
}
</style>
