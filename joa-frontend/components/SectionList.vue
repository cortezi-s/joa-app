<template>
  <div class="box">
    <table class="table is-striped is-fullwidth">
      <thead>
        <tr>
          <th>Nome</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="section in sections"
          :key="section.id"
          :collaborator="section"
        >
          <td>{{ section.pretty_name }}</td>
          <td>
            <a @click="editSection(section)">
              <span class="icon">
                <i class="fas fa-edit"></i>
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
      sections: [],
      actionSection: {}
    }
  },
  created() {
    this.fetchSections()
  },
  methods: {
    fetchSections() {
      this.$axios.$get('/api/v1/admin/sections').then(response => {
        this.sections = response
      })
    },
    editSection(section) {
      this.$emit('edit:section', section)
    }
  }
}
</script>
