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

        <div class="columns">
          <div class="column document is-6">
            <div class="text">
              <p>
                Confira alguns documentos importantes disponíveis para download:
              </p>
            </div>
            <ul>
              <li v-for="doc in documents" :key="doc.id" :doc="doc">
                <a :href="doc.file.url" target="_blank">
                  <b-icon
                    pack="fas"
                    icon="download"
                    size="is-small"
                    type="is-info">
                  </b-icon>
                  <span>{{ doc.name }}</span>
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

<style lang="scss" scoped>
  .column.document {
    padding: 1rem;
    border-radius: 10px;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    background-color: #FFFEFE;
    & ul > li:not(:last-child), p {
      padding-bottom: 20px;
    }
    & .icon {
      padding-right: 8px;
    }
  }
</style>