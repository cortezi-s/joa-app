<template>
  <div id="noticias">
    <section class="contactBg is-hidden-mobile">
      <svg width="875" height="595" viewBox="0 0 875 595" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M758.623 125.21C652.43 37.0787 453.411 24.0489 270.056 96.0085C173.087 134.041 83.1704 195.065 48.4476 292.967C-13.6246 467.913 173.952 493.532 294.051 492.924C352.149 492.653 407.681 498.274 459.335 509.419C552.26 529.488 712.444 535.914 810.106 381.754C880.896 270.016 829.285 183.854 758.623 125.21Z" fill="#F0F2F4"/>
      </svg>
    </section>
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
        <div class="columns is-centered">
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
              <div class="has-text-centered">
                <b-button
                  type="is-info"
                  icon-left="paper-plane"
                >
                  Enviar mensagem
                </b-button>
              </div>
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
  .box {
    border-radius: 10px;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
    background-color: #FFFEFE;
    padding-left: 2rem;
    padding-right: 2rem;
  }
  a.link {
    font-weight: 400;
    font-size: 0.9rem;
  }
  .contactBg {
    position: absolute;
    top: 10rem;
    left: 50%;
    transform: translate(-50%);
    z-index: -1;
    opacity: 0.5;
    & svg {
      transform: rotate(30deg);
      width: 90%;
    }
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