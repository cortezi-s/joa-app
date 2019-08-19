<template>
  <div class="box">
    <form enctype="multipart/form-data" @submit.prevent="formSubmitted">
      <b-field label="Nome">
        <b-input v-model="doc.name" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field class="file">
        <b-upload
          v-model="doc.file"
          accept=".txt,.csv,.html,.xhtml,.xml,.pdf,.doc,.docx,.ppt,.xls,.xlsx,.rtf,.vsd"
        >
          <a class="button">
              <b-icon icon="upload"></b-icon>
              <span v-if="this.doc.id">Alterar arquivo</span>
              <span v-else>Arquivo</span>
          </a>
        </b-upload>
        <span class="file-name" v-if="doc.file">
            {{ doc.file.name }}
        </span>
      </b-field>
      <p class="help is-block has-text-grey">
        <strong>Extensões permitidas:</strong> .txt, .csv, .html, .xhtml, .xml, .pdf, .doc, .docx, .ppt, .xls, .xlsx, .rtf, .vsd.
      </p>
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
    doc: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      formData: null,
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar'
    }
  },
  methods: {
    formSubmitted() {
      this.formData = new FormData()
      this.formData.append('document[name]', this.doc.name)
      if(this.doc.file instanceof File) {
        this.formData.append('document[file]', this.doc.file)
      }

      if (this.doc.id) {
        this.editDocument()
      } else {
        this.addDocument()
      }
    },
    async addDocument() {
      this.isSubmitting = true
      await this.$axios.$post('/api/v1/admin/documents', this.formData)
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    },
    async editDocument() {
      this.isSubmitting = true
      await this.$axios.$patch(`/api/v1/admin/documents/${this.doc.id}`, this.formData)
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    }
  }
}
</script>

<style lang="scss" scoped>
  .help {
    padding-bottom: 10px;
    margin-top: -8px;
  }
</style>
