<template>
  <div class="box">
    <table class="table is-striped is-fullwidth">
      <thead>
        <tr>
          <th></th>
          <th>Nome</th>
          <th>Cargo</th>
          <th></th>
          <th></th>
        </tr>
      </thead>
      <draggable v-model="collaborators" tag="tbody" handle=".handle" @change="changeListOrder($event)">
        <tr
          v-for="collaborator in collaborators"
          :key="collaborator.id"
          :collaborator="collaborator"
        >
          <td><i class="fa fa-align-justify handle"></i></td>
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
      collaborators: [],
      actionCollaborator: {}
    }
  },
  created() {
    this.fetchCollaborators()
  },
  methods: {
    changeListOrder(e) {
      this.actionCollaborator = e.moved.element
      let newPosition = e.moved.newIndex + 1;
      if(newPosition !== this.actionCollaborator.position) {
        this.actionCollaborator.position = newPosition;
        this.updateCollaboratorPosition()
      }
    },
    updateCollaboratorPosition() {
      this.$axios.$patch(`/api/v1/admin/collaborators/${this.actionCollaborator.id}`, {
        collaborator: this.actionCollaborator
      })
    },
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

<style lang="scss" scoped>
.handle {
  cursor: pointer;
}
</style>
