<template>
  <div class="box">
    <form enctype="multipart/form-data" @submit.prevent="formSubmitted">
      <b-field grouped>
        <b-field label="Nome da empresa" expanded>
          <b-input v-model="project.company_name" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Imagem" expanded>
          <b-upload v-model="project.hero_image">
              <a class="button is-primary">
                  <b-icon icon="upload"></b-icon>
                  <span>Click to upload</span>
              </a>
          </b-upload>
          <span class="file-name" v-if="project.hero_image">
              {{ project.hero_image.name }}
          </span>
        </b-field>
      </b-field>
      <b-field label="Fundadores">
        <b-input v-model="project.founders" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Localização" expanded>
          <b-input v-model="project.location" :disabled="successSubmit">
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
          v-model="project.description"
          type="textarea"
          :disabled="successSubmit"
        >
        </b-input>
      </b-field>
      <b-field label="Página web">
        <b-input v-model="project.homepage" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Facebook" expanded>
          <b-input v-model="project.facebook" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Linkedin" expanded>
          <b-input v-model="project.linkedin" :disabled="successSubmit">
          </b-input>
        </b-field>
      </b-field>
      <b-field grouped>
        <b-field label="Twitter" expanded>
          <b-input v-model="project.twitter" :disabled="successSubmit">
          </b-input>
        </b-field>
        <b-field label="Instagram" expanded>
          <b-input v-model="project.instagram" :disabled="successSubmit">
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
  props: {
    project: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      file: null,
      formData: null,
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar'
    }
  },
  methods: {
    formSubmitted() {
      this.formData = new FormData()
      Object.entries(this.project).forEach(
        ([key, value]) => this.formData.append(`project[${key}]`, value)
      )
      if (this.project.id) {
        this.editProject()
      } else {
        this.addProject()
      }
    },
    async addProject() {
      this.isSubmitting = true
      await this.$axios.$post('/api/v1/admin/projects', this.formData)
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    },
    async editProject() {
      this.isSubmitting = true
      await this.$axios.$patch(`/api/v1/admin/projects/${this.project.id}`, this.formData)
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    }
  }
}
</script>
