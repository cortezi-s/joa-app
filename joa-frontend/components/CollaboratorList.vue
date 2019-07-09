<template>
  <div class="box">
    <table class="table is-striped is-fullwidth">
      <thead>
        <tr>
          <th>Nome</th>
          <th>Cargo</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="collaborator in collaborators"
          :key="collaborator.id"
          :collaborator="collaborator"
        >
          <td>{{ collaborator.name }}</td>
          <td>{{ collaborator.role }}</td>
          <td>
            <a @click="editCollaborator(collaborator)">
              <span class="icon">
                <i class="fas fa-edit"></i>
              </span>
            </a>
          </td>
          <td>
            <a @click="removeCollaborator(collaborator)">
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
      collaborators: [],
      actionCollaborator: {}
    }
  },
  created() {
    this.fetchCollaborators()
  },
  methods: {
    fetchCollaborators() {
      this.$axios.$get('/api/v1/admin/collaborators').then(response => {
        this.collaborators = response
        console.log(response)
      })
    },
    editCollaborator(collaborator) {
      this.$emit('edit:collaborator', collaborator)
    },
    removeCollaborator(collaborator) {
      this.actionCollaborator = collaborator
      this.$dialog.confirm({
        title: 'Remover colaborador',
        message: `Tem certeza que você deseja remover <b>${
          collaborator.name
        }</b>?`,
        confirmText: 'Remover',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: this.deleteCollaborator
      })
    },
    deleteCollaborator() {
      this.$axios
        .delete(`/api/v1/admin/collaborators/${this.actionCollaborator.id}`)
        .then(response => {
          if (response.status === 204) {
            this.collaborators.splice(
              this.collaborators.indexOf(this.actionCollaborator),
              1
            )
          }
        })
    }
  }
}
</script>
