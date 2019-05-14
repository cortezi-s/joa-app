<template>
  <div class="box">
    <p class="title is-size-2">Colaboradores</p>
    <form @submit.prevent="addCollaborator">
      <b-field label="Nome">
        <b-input v-model="newCollaborator.name" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Cargo" expanded>
          <b-input v-model="newCollaborator.role" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Linkedin" expanded>
          <b-input v-model="newCollaborator.linkedin" :disabled="successSubmit">
          </b-input>
        </b-field>
      </b-field>
      <b-field label="Mensagem">
        <b-input
          v-model="newCollaborator.message"
          type="textarea"
          :disabled="successSubmit"
        >
        </b-input>
      </b-field>
      <b-field>
        <p class="control">
          <button
            type="submit"
            class="button"
            :class="{
              'is-primary': !successSubmit,
              'is-success': successSubmit,
              'is-loading': isSubmitting
            }"
            :disabled="successSubmit"
          >
            <span v-if="successSubmit" class="icon is-small">
              <i class="fas fa-check"></i>
            </span>
            <span>
              {{ submitText }}
            </span>
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
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar',
      newCollaborator: {}
    }
  },
  methods: {
    async addCollaborator() {
      this.isSubmitting = true
      const result = await this.$axios.$post('collaborators', {
        collaborator: this.newCollaborator
      })
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
      console.log(result)
    }
  }
}
</script>
