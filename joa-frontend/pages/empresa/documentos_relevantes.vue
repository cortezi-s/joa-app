<template>
  <div id="institucional">
    <section class="section">
      <div class="container">
        <div class="is-inline-block mt">
          <div class="titleDiv">
            <div>
              <h2>Documentos Relevantes</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>

        <div class="columns is-multiline">
          <div class="column">
            <ul>
              <li v-for="doc in documents" :key="doc.id" :doc="doc">
                <a :href="doc.file.url" target="_blank">
                  {{ doc.name }}
                </a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        documents: []
      }
    },
    created() {
      this.fetchDocuments()
    },
    methods: {
      fetchDocuments() {
        this.$axios.$get('/api/v1/documents').then(response => {
          this.documents = response
        })
      }
    }
  }
</script>