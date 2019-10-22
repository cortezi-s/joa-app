<template>
  <div>
    <nav class="navbar is-transparent" role="navigation" aria-label="main navigation">
      <div class="container">
        <div class="navbar-brand">
          <a class="navbar-item" href="/">
            <img src="~/assets/logo-web.svg" alt="Joá Assessoria" width="225" height="45" class="logoMob">
            <img src="~/assets/logo-light.svg" alt="Joá Assessoria" width="225" height="45" class="logoDesktop">
          </a>
          <a role="button" class="navbar-burger burger" aria-label="menu" aria-expanded="false" data-target="joaNavbar">
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
            <span aria-hidden="true"></span>
          </a>
        </div>
        <div class="navbar-end">
          <div id="joaNavbar" class="navbar-menu">
            <div class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link is-arrowless">
                EMPRESA
              </a>

              <div class="navbar-dropdown is-boxed">
                <a href="/empresa/institucional" class="navbar-item">
                  Institucional
                </a>
                <a class="navbar-item is-hidden">
                  Governança
                </a>
                <a href="/empresa/time" class="navbar-item">
                  Time
                </a>
                <a href="/empresa/comites" class="navbar-item">
                  Comitês
                </a>
                <a href="/empresa/documentos_relevantes" class="navbar-item">
                  Documentos relevantes
                </a>
              </div>
            </div>
            <div class="navbar-item has-dropdown is-hoverable">
              <a class="navbar-link is-arrowless">
                NEGÓCIOS
              </a>

              <div class="navbar-dropdown is-boxed">
                <a class="navbar-item">
                  Fundos
                </a>
                <a href="/negocios/portfolio" class="navbar-item">
                  Portfólio
                </a>
              </div>
            </div>

            <a href="/contato" class="navbar-item contactMenu">
              CONTATO
            </a>

          </div>
        </div>
      </div>
    </nav>
    <nuxt/>
    <footer class="footer">
      <div class="container">
        <div class="columns" data-aos="fade-right">
          <div class="column is-half is-full-mobile">
            <div class="columns">
              <div class="column">
                <strong>EMPRESA</strong>
                <br /><br />
                <a href="/empresa/institucional">Institucional</a><br />
                <span class="is-hidden"><a href="#">Governança</a><br /></span>
                <a href="/empresa/time">Time</a><br />
                <a href="/empresa/comites">Comitês</a><br />
                <a href="#">Documentos relevantes</a>
              </div>
              <div class="column">
                <strong>NEGÓCIOS</strong>
                <br /><br />
                <a href="#">Fundos</a><br />
                <a href="/negocios/portfolio">Portfólio</a><br />
              </div>
              <div class="column has-text-left">
                <strong>CONTATO</strong>
                <br /><br />
                <a href="#">Contato</a><br />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="gaveaBg is-hidden-mobile" data-aos="fade-left">
        <svg width="780" height="257" viewBox="0 0 780 257" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M797.29 38.2027L780.672 74.8619L723.088 96.4715L710.72 87.982L703.764 75.2477L685.986 64.0571L631.494 56.7252L585.504 32.8003L586.277 13.506L580.093 1.15766L541.06 4.24475L536.035 0L525.214 0.771772L522.123 11.5766L507.05 15.8213L471.881 47.464L466.471 54.4099L448.307 50.5511L444.055 46.6922L436.712 46.3063L394.201 62.8994L393.428 79.1066L386.858 89.1396L342.027 177.893L290.24 208.764L266.279 212.623L246.955 206.835L228.018 207.607L200.579 216.868L149.178 214.938L57.5842 241.95L47.536 237.706L32.0771 236.548L18.5506 241.179L0 251.984V253.527C0.386471 254.685 0.772942 255.842 1.15941 257H790.72C807.725 211.465 817 162.458 817 110.749C817 83.3514 814.295 56.3393 809.271 30.485H806.565L797.29 38.2027Z" fill="#3F3D56"/>
        </svg>
      </div>

        <div class="container" data-aos="fade-right">
          <img src="~/assets/logo-web.svg" alt="Joá Assessoria" width="225" height="45" class="logoFooter">
        </div>

    </footer>
    <div class="modal">
      <div class="disclaimer">
        <div class="logo">
          <img src="~/assets/logo-web.svg" alt="Joá Assessoria" width="175" height="35">
        </div>
        <h1>Aviso de Condição Pré-Operacional</h1>
        <div class="text">
          <p>A <strong>Joa Assessoria</strong> encontra-se em processo de credenciamento junto à Comissão de Valores Mobiliários (CVM) para atuar como administradora de carteira de valores mobiliários na categoria gestora de recursos, nos termos da Instrução CVM nº 558 de 26 de Março de 2015.</p>

          <p>A Joa Assessoria encontra-se, portanto, em fase pré-operacional e não realiza qualquer atividade de gestão. Todas as informações publicadas neste site visam, no momento, atender as demandas do regulador dentro do próprio processo de credenciamento.</p>

          <p>Atenciosamente, <br />
          Joa Assessoria</p>
        </div>
        <div class="error">
          <p>Para acessar o site, você precisa concordar com os termos acima.</p>
        </div>
        <div class="buttons">
          <a class="no" @click="no">
            <span>Não concordo</span>
          </a>
          <a class="yes" @click="accept">
            <span>Li e concordo</span>
          </a>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    data() {
      return {
        acceptValue: ''
      }
    },
    methods: {
      burgerInit(){
        const $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0)

        if ($navbarBurgers.length > 0) {

          $navbarBurgers.forEach(el => {
            el.addEventListener('click', () => {

              const target = el.dataset.target
              const $target = document.getElementById(target)

              el.classList.toggle('is-active')
              $target.classList.toggle('is-active')

            })
          })
        }
      },
      async aosInit() {
        const AOS = await import('aos')
        AOS.init({
          delay: 0,
          disable: 'phone',
          duration: 600,
          easing: 'ease-out-back',
        })
      },
      check() {
        if (this.$cookie.get('accept')) {
          this.acceptValue = this.$cookie.get('accept')
        } else {
          let body = document.querySelector('body')
          let modal = document.querySelector('.modal')
          let disclaimer = document.querySelector('.modal > .disclaimer')
          body.style.cssText = 'overflow-y: hidden; position: fixed; width: 100%; bottom: 0px; top: 0px;'
          modal.classList.add('active')
        }
      },
      accept(){
        this.$cookie.set('accept', 'yes', 1)
        document.location.reload(true)

      },
      no() {
        let errorMsg = document.querySelector('.disclaimer > .error')
        errorMsg.className = 'error active animated shake'
      }
    },
    beforeMount() {
      this.check()
    },
    mounted() {
      this.burgerInit()
      this.aosInit()
    }
  }
</script>

<style lang="scss" scoped>
  .modal {
    display: none;
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    height: 100%;
    width: 100%;
    background: rgba(255, 255, 255, 0.6);
    backdrop-filter: blur(20px);
    &.active { display: block; }
    > .disclaimer {
      position: relative;
      display: block;
      width: 60%;
      min-height: 661px;
      background: #FFFFFF;
      box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.25);
      border-radius: 20px;
      margin: 0 auto;
      margin-top: 120px;
      .logo {
        width: fit-content;
        margin: 0 auto;
        img { margin-top: 65px; }
      }
      h1 {
        margin-top: 21px;
        font-style: normal;
        font-weight: 800;
        font-size: 32px;
        line-height: 38px;
        color: #28004C;
        text-align: center;
      }
      .text {
        max-width: 720px;
        margin: 0 auto;
        margin-top: 24px;
        line-height: 22px;
        margin-bottom: 24px;
      }
      .error {
        display: flex;
        opacity: 0;
        max-width: 720px;
        min-height: 60px;
        margin: 0 auto;
        background: #28004C;
        border-radius: 10px;
        justify-content: center;
        align-items: center;
        p { color: #ffffff; }
        margin-bottom: 30px;
        transition: opacity 500ms ease-in-out;
        &.active { opacity: 1; }
      }
      .buttons {
        max-width: 720px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: center;
        a {
          width: 240px;
          height: 54px;
          border-radius: 10px;
          box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.25);
          display: flex;
          align-items: center;
          justify-content: center;
          transition: all 100ms ease-in-out;
          &.no {
            background: #ffffff;
            font-size: 18px;
            font-weight: bold;
            color: #28004C;
          }
          &.yes {
            background: #FF7300;
            color: #FFFFFF;
            font-size: 18px;
            font-weight: bold;
          }
        }
      }
    }
  }

 @media screen and (max-width: 769px) {
    .modal {
      > .disclaimer {
        border-radius: unset;
        position: relative;
        overflow: auto;
        overflow-x: hidden;
        width: 100%;
        height: 100vh;
        margin-top: unset;
        padding: 20px;
        h1 {
          font-size: 22px;
          line-height: 24px;
          margin-top: unset;
        }
        .logo img { margin-top: unset; }
        .error { padding: 20px; }
        .buttons {
          display: block;
          a {
            width: 100%;
            margin-bottom: 20px;
          }
        }
      }
    }
  }


  nav {
    padding-top: 1.5rem;
  }
  .logoDesktop {
    display: none;
  }
  .logoMob {
    display: block;
  }
  .footer {
    position: relative;
    bottom: 0;
    background: transparent;
    background-image: url(../assets/footer.svg);
    background-size: cover;
    & .gaveaBg {
      position: absolute;
      bottom: 0px;
      right: 0px;
      z-index: 10;
    }
    font-size: 16px;
    color: #28004C;
    & strong {
      color: #28004C;
    }
    & .container {
      padding-top: 10rem;
      & * > a:hover {
        color: #FF7300;
      }
    }
    & .logoFooter {
      -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
      filter: grayscale(100%);
    }
  }
  @media screen and (min-width: 769px), print {
    .modal > .disclaimer > .buttons {
      a:hover { box-shadow: 0px 8px 10px rgba(0, 0, 0, 0.25); }
    }
    .logoDesktop {
      display: block;
    }
    .logoMob {
      display: none;
    }
    .navbar-link.is-arrowless {
      color: white;
    }
    .navbar-item.contactMenu {
      color: white;
    }
    .footer {
      font-size: 12px;
      margin-top: 4.5rem;
      min-height: 560px;
    }
  }
</style>