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
        <tr v-for="doc in documents" :key="doc.id" :document="doc">
          <td>{{ doc.name }}</td>
          <td>
            <a @click="editDocument(doc)">
              <span class="icon">
                <i class="fas fa-edit"></i>
              </span>
            </a>
          </td>
          <td>
            <a @click="removeDocument(doc)">
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
      documents: [],
      actionDocument: {}
    }
  },
  created() {
    this.fetchDocuments()
  },
  methods: {
    fetchDocuments() {
      this.$axios.$get('/api/v1/admin/documents').then(response => {
        this.documents = response
      })
    },
    editDocument(doc) {
      this.$emit('edit:document', doc)
    },
    removeDocument(doc) {
      this.actionDocument = doc
      this.$dialog.confirm({
        title: 'Remover documento',
        message: 'Tem certeza que você deseja remover esse documento?',
        confirmText: 'Remover',
        type: 'is-danger',
        hasIcon: true,
        onConfirm: this.deleteDocument
      })
    },
    deleteDocument() {
      this.$axios
        .delete(`/api/v1/admin/documents/${this.actionDocument.id}`)
        .then(response => {
          if (response.status === 204) {
            this.documents.splice(this.documents.indexOf(this.actionDocument), 1)
          }
        })
    }
  }
}
</script>
