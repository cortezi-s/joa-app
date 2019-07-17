<template>
  <div id="time">
    <section class="section">
      <div class="container">
        <div class="is-inline-block">
          <div class="titleDiv">
            <div>
              <h2>Time</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>

        <div class="columns is-multiline">
          <div class="column is-4 is-flex" v-for="collaborator in collaborators">
            <div class="card">
              <div class="card-content">
                <div class="media">
                  <div class="media-content">
                    <h3>{{ collaborator.name }}</h3>
                    <p class="tag role">{{ collaborator.role }}</p>
                  </div>
                </div>
                <div class="content">
                  <p class="text description has-text-justified">
                    {{ collaborator.message }}
                  </p>
                </div>
              </div>
            </div>
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
        collaborators: []
      }
    },
    created() {
      this.fetchCollaborators()
    },
    methods: {
      fetchCollaborators() {
        this.$axios.$get('/api/v1/collaborators').then(response => {
          this.collaborators = response
          console.log(response)
        })
      }
    }
  }
</script>

<style lang="scss" scoped>
  .card {
    border-radius: 10px;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    background-color: #FFFEFE;
  }
  .tag.role {
    margin-top: 0.5rem;
    background-color: #00B0CB;
    font-weight: 600;
    color: white;
    border-radius: 10px;
  }
  .mt {
    margin-top: 4.5rem;
  }
  .text.description {
    font-size: 0.9rem;
  }
  h3 ~ p {
    margin-top: 1rem;
  }
</style>