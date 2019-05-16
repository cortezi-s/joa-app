<template>
  <div class="box">
    <table class="table is-striped is-fullwidth">
      <thead>
        <tr>
          <th>Nome</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="project in projects" :key="project.id" :project="project">
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
      </tbody>
    </table>
  </div>
</template>

<script>
export default {
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
    fetchProjects() {
      this.$axios.$get('projects').then(response => {
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
      this.$axios.delete(`projects/${this.actionProject.id}`).then(response => {
        if (response.status === 204) {
          this.projects.splice(this.projects.indexOf(this.actionProject), 1)
        }
      })
    }
  }
}
</script>
