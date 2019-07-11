<template>
  <div id="noticias">
    <section class="section">
      <div class="container">
        <div class="is-inline-block">
          <div class="titleDiv">
            <div>
              <h2>Contato</h2>
            </div>
            <div>
              <hr />
            </div>
          </div>
        </div>
        <div class="columns is-multiline">
          <div class="column is-4">
            <div class="box">
            <form>
              <b-field label="Nome">
                <b-input></b-input>
              </b-field>
              <b-field label="Email">
                <b-input></b-input>
              </b-field>
              <b-field label="Assunto">
                <b-input></b-input>
              </b-field>
              <b-field label="Mensagem">
                <b-input type="textarea" rows="8"></b-input>
              </b-field>
            </form>
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
      }
    }
  }
</script>