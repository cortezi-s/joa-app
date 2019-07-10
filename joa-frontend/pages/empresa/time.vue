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
                  <p class="text description">
                    {{ collaborator.message }}
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="is-inline-block mt">
          <div class="titleDiv">
            <div>
              <h2>Comitês</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>

        <div class="columns is-multiline">
          <div class="column is-half">
            <h3>Comitê de Investimentos</h3>
            <p class="text">
              Formado pelo Diretor de Gestão e analistas da área de gestão de recursos.<br />
              O comitê tem como objetivo realizar pesquisas e discussões sobre cenários
              e premissas, buscando a estratégia mais adequada para alocação de recursos
              no curto, médio e longo prazos. Também delibera sobre e aprova novos
              investimentos e desinvestimentos.
            </p>
          </div>
          <div class="column is-half">
            <h3>Comitê estratégico e de conformidade</h3>
            <p class="text">
              Composto pelo Diretor de Conformidade e membros da área de
              compliance. Responsável por definir as principais metas e estratégias da
              Joa Assessoria, avaliando o desempenho das equipes e planos futuros.
              Também são discutidas políticas de controle de riscos e normas internas da
              companhia, revisando e implementando métodos de controle de forma que
              estes se adequem ao perfil da empresa. Delibera também sobre o impacto e
              cumprimento das leis e regulamentações aplicáveis à empresa, o eventual
              descumprimento do Código de Ética e demais políticas da Joa Assessoria,
              assim como das leis e regulamentações aplicáveis, e as situações que não
              estejam previstas nas políticas internas.
            </p>
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