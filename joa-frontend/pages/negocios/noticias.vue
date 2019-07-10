<template>
  <div id="noticias">
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
                    <h3>{{ article.title }}</h3>
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

<style lang="scss" scoped>
  h3 ~ p {
    margin-top: 1rem;
  }
  .card {
    border-radius: 10px;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    background-color: #FFFEFE;
  }
  a.link {
    font-weight: 400;
    font-size: 0.9rem;
  }
</style>

<script>
  export default {
    data() {
      return {
        articles: []
      }
    },
    created() {
      this.fetchArticles()
    },
    methods: {
      fetchArticles() {
        this.$axios.$get('/api/v1/articles').then(response => {
          this.articles = response
          console.log(response)
        })
      }
    }
  }
</script>