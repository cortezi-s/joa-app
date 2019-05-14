<template>
  <div class="box">
    <p class="title is-size-2">Projetos</p>
    <form @submit.prevent="addProject">
      <b-field label="Nome da empresa">
        <b-input v-model="newProject.company_name"></b-input>
      </b-field>
      <b-field label="Fundadores">
        <b-input v-model="newProject.founders"></b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Localização" expanded>
          <b-input v-model="newProject.location"></b-input>
        </b-field>
        <b-field label="Data" expanded>
          <b-datepicker placeholder="Selecione uma data..." icon="calendar-alt">
          </b-datepicker>
        </b-field>
      </b-field>
      <b-field label="Descrição">
        <b-input v-model="newProject.description" type="textarea"></b-input>
      </b-field>
      <b-field label="Página web">
        <b-input v-model="newProject.homepage"></b-input>
      </b-field>
      <b-field grouped>
        <b-field label="Facebook" expanded>
          <b-input v-model="newProject.facebook"></b-input>
        </b-field>
        <b-field label="Linkedin" expanded>
          <b-input v-model="newProject.linkedin"></b-input>
        </b-field>
      </b-field>
      <b-field grouped>
        <b-field label="Twitter" expanded>
          <b-input v-model="newProject.twitter"></b-input>
        </b-field>
        <b-field label="Instagram" expanded>
          <b-input v-model="newProject.instagram"></b-input>
        </b-field>
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
  name: 'ProjectAdmin',
  data() {
    return {
      newProject: {}
    }
  },
  methods: {
    async addProject() {
      const result = await this.$axios.$post('projects', {
        project: this.newProject
      })
      console.log(result)
    }
  }
}
</script>
