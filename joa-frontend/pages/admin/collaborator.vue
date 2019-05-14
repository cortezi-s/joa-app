<template>
  <div class="box">
    <p class="title is-size-2">Colaboradores</p>
    <form @submit.prevent="addCollaborator">
      <b-field label="Nome">
        <b-input v-model="newCollaborator.name"></b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Cargo" expanded>
          <b-input v-model="newCollaborator.role"></b-input>
        </b-field>
        <b-field label="Linkedin" expanded>
          <b-input v-model="newCollaborator.linkedin"></b-input>
        </b-field>
      </b-field>
      <b-field label="Mensagem">
        <b-input v-model="newCollaborator.message" type="textarea"></b-input>
      </b-field>
      <b-field>
        <p class="control">
          <button type="submit" class="button is-primary">
            Salvar
          </button>
        </p>
      </b-field>
    </form>
  </div>
</template>

<script>
export default {
  name: 'CollaboratorAdmin',
  data() {
    return {
      newCollaborator: {}
    }
  },
  methods: {
    async addCollaborator() {
      const result = await this.$axios.$post('collaborators', {
        collaborator: this.newCollaborator
      })
      console.log(result)
    }
  }
}
</script>
