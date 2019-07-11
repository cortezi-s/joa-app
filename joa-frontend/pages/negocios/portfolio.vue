<template>
  <div id="portfolio">
    <section class="section">
      <div class="container">
        <div class="columns">
          <div class="column is-half">
            <p class="text">
              A <strong>Joa Assessoria</strong> faz parte do <strong>Grupo Joa Investimentos</strong>, holding que atua
              no mercado brasileiro de Private Equity e conta com diversos negócios. Os
              principais integrantes do portfólio do grupo são:
            </p>
            <br />
          </div>
        </div>
        <div class="is-inline-block">
          <div class="titleDiv">
            <div>
              <h2>Portfólio</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>
        <div class="columns is-multiline">
          <div class="column is-4 is-flex" v-for="project in projects">
            <div class="card">
              <div class="card-image">
                <figure class="image">
                  <img :src="project.image" :alt='project.company_name'>
                </figure>
              </div>
              <div class="card-content">
                <div class="media">
                  <div class="media-content">
                    <h3>{{ project.company_name }}</h3>
                  </div>
                </div>
                <div class="content">
                  <p class="text description">
                    {{ project.description }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="section">
      <div class="container">
        <div class="is-inline-block">
          <div class="titleDiv">
            <div>
              <h2>Notícias</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>
        <div class="columns is-multiline">
          <div class="column is-3" v-for="article in articles">
            <div class="card">
              <div class="card-content">
                <div class="media">
                  <div class="media-content">
                    <h4>{{ article.title }}</h4>
                    <p class="text">
                      <b-icon
                        pack="fas"
                        icon="newspaper"
                        size="is-small"
                        type="is-light">
                      </b-icon>
                      <span>{{ article.source }}</span>
                    </p>
                    <p class="text">
                      <a :href='article.link' class="has-text-info link">
                        <b-icon
                          pack="fas"
                          icon="link"
                          size="is-small"
                          type="is-info">
                        </b-icon>
                        <span>Ler matéria -></span>
                      </a>
                    </p>
                  </div>
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
        projects: [],
        articles: []
      }
    },
    created() {
      this.fetchProjects(),
      this.fetchArticles()
    },
    methods: {
      fetchProjects() {
        this.$axios.$get('/api/v1/projects').then(response => {
          this.projects = response
          console.log(response)
        })
      },
      fetchArticles() {
        this.$axios.$get('/api/v1/articles').then(response => {
          this.articles = response
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
  figure.image > img {
    border-top-left-radius: 10px;
    border-top-right-radius: 10px;
  }
  h4 ~ p {
    margin-top: 1rem;
  }
</style>