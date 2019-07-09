<template>
  <div class="box">
    <form @submit.prevent="formSubmitted">
      <b-field label="Nome">
        <b-input v-model="collaborator.name" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Cargo" expanded>
          <b-input v-model="collaborator.role" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Linkedin" expanded>
          <b-input v-model="collaborator.linkedin" :disabled="successSubmit">
          </b-input>
        </b-field>
      </b-field>
      <b-field label="Mensagem">
        <b-input
          v-model="collaborator.message"
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
  props: {
    collaborator: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar'
    }
  },
  methods: {
    formSubmitted() {
      if (this.collaborator.id) {
        this.editCollaborator()
      } else {
        this.addCollaborator()
      }
    },
    async addCollaborator() {
      this.isSubmitting = true
      await this.$axios.$post('/api/v1/admin/collaborators', {
        collaborator: this.collaborator
      })
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    },
    async editCollaborator() {
      this.isSubmitting = true
      await this.$axios.$patch(
        `/api/v1/admin/collaborators/${this.collaborator.id}`,
        {
          collaborator: this.collaborator
        }
      )
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    }
  }
}
</script>
