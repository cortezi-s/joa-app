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
              <form @submit.prevent="formSubmitted">
                <b-field label="Nome" :message="errors.name" :type="{'is-danger': errors.name}">
                  <b-input v-model="contact.name"></b-input>
                </b-field>
                <b-field label="Email" :message="errors.email" :type="{'is-danger': errors.email}">
                  <b-input v-model="contact.email"></b-input>
                </b-field>
                <b-field label="Assunto" :message="errors.subject" :type="{'is-danger': errors.subject}">
                  <b-input v-model="contact.subject"></b-input>
                </b-field>
                <b-field label="Mensagem" :message="errors.message" :type="{'is-danger': errors.message}">
                  <b-input v-model="contact.message" type="textarea" rows="8"></b-input>
                </b-field>
                <b-field>
                  <p class="control has-text-centered">
                    <button
                      type="submit"
                      class="button is-info"
                      :class="{'is-loading': isSubmitting }"
                      :disabled="successSubmit"
                    >
                      <template v-if="successSubmit">
                        <span>
                          Mensagem enviada
                        </span>
                        <span class="icon is-small">
                          <i class="fas fa-check"></i>
                        </span>
                      </template>
                      <template v-else>
                        <span class="icon is-small">
                          <i class="fas fa-paper-plane"></i>
                        </span>
                        <span>
                          Enviar mensagem
                        </span>
                      </template>
                    </button>
                  </p>
                </b-field>
              </form>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  import status from 'http-status'
  export default {
    data() {
      return {
        contact: {},
        isSubmitting: false,
        successSubmit: false,
        errors: {
          name: null,
          email: null,
          subject: null,
          message: null
        }
      }
    },
    methods: {
      formSubmitted() {
        if(this.formIsValid()){
          this.sendMessage()
        }
      },
      formIsValid() {
        var valid = true
        this.errors.name = null
        this.errors.email = null
        this.errors.subject = null
        this.errors.message = null
        if(this.contact.name === undefined || !this.contact.name.trim()) {
          this.errors.name = 'Este campo é obrigatório'
          valid = false
        }
        if(this.contact.email === undefined || !this.contact.email.trim()) {
          this.errors.email = 'Este campo é obrigatório'
          valid = false
        } else if(!this.validateEmail(this.contact.email)) {
          this.errors.email = 'Email inválido'
          valid = false
        }
        if(this.contact.subject === undefined || !this.contact.subject.trim()) {
          this.errors.subject = 'Este campo é obrigatório'
          valid = false
        }
        if(this.contact.message === undefined || !this.contact.message.trim()) {
          this.errors.message = 'Este campo é obrigatório'
          valid = false
        }

        return valid
      },
      validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        return re.test(String(email).toLowerCase())
      },
      sendMessage() {
        this.isSubmitting = true
        this.$axios
          .post('/contact', {
            contact: this.contact
          })
          .then(response => {
            this.isSubmitting = false
            if(response.status === status.OK) {
              this.successSubmit = true
            }
          })
      }
    }
  }
</script>

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
