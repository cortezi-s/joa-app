<template>
  <div class="box">
    <p class="title is-size-2">Projetos</p>
    <form @submit.prevent="addProject">
      <b-field label="Nome da empresa">
        <b-input v-model="newProject.company_name" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field label="Fundadores">
        <b-input v-model="newProject.founders" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Localização" expanded>
          <b-input v-model="newProject.location" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Data" expanded>
          <b-datepicker
            placeholder="Selecione uma data..."
            icon="calendar-alt"
            :disabled="successSubmit"
          >
          </b-datepicker>
        </b-field>
      </b-field>
      <b-field label="Descrição">
        <b-input
          v-model="newProject.description"
          type="textarea"
          :disabled="successSubmit"
        >
        </b-input>
      </b-field>
      <b-field label="Página web">
        <b-input v-model="newProject.homepage" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Facebook" expanded>
          <b-input v-model="newProject.facebook" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Linkedin" expanded>
          <b-input v-model="newProject.linkedin" :disabled="successSubmit">
          </b-input>
        </b-field>
      </b-field>
      <b-field grouped>
        <b-field label="Twitter" expanded>
          <b-input v-model="newProject.twitter" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Instagram" expanded>
          <b-input v-model="newProject.instagram" :disabled="successSubmit">
          </b-input>
        </b-field>
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
  name: 'ProjectAdmin',
  data() {
    return {
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar',
      newProject: {}
    }
  },
  methods: {
    async addProject() {
      this.isSubmitting = true
      const result = await this.$axios.$post('projects', {
        project: this.newProject
      })
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
      console.log(result)
    }
  }
}
</script>
