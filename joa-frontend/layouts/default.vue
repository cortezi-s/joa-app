<template>
  <div>
    <nav class="navbar is-transparent" role="navigation" aria-label="main navigation">
      <div class="container">
        <div class="navbar-brand">
          <a class="navbar-item" href="/">
            <img src="~/assets/logo-web.svg" alt="Joá Assessoria" width="225" height="45">
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
  </div>
</template>

<script>
  export default {
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
      }
    },
    mounted() {
      this.burgerInit()
      this.aosInit()
    }
  }
</script>

<style lang="scss">
  nav {
    padding-top: 1.5rem;
  }
  .navbar-item.contactMenu:hover {
    color: #FF7300;
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
  @media screen and (min-width: 768px), print {
    .footer {
      font-size: 12px;
      margin-top: 4.5rem;
      min-height: 560px;
    }
  }
</style>