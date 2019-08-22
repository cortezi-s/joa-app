<template>
  <div id="home">
    <section class="homeHero is-hidden-mobile">
      <video autoplay="autoplay" loop="loop" playsinline="true" preload="auto" muted="muted" poster="~/assets/videos/fullscreenPoster.jpg">
        <source src="~/assets/videos/fullscreen.webm" type="video/webm">
        <source src="~/assets/videos/fullscreen.mp4" type="video/mp4">
      </video>
    </section>

    <section class="section heroText" data-aos="fade-down">
      <div class="container">
        <div class="columns is-centered">
          <div class="column is-half">
            <h1>
              Buscamos negócios <br />inovadores
            </h1>
            <h1 class="sub">
              Visando a geração de valor <br class="is-hidden-mobile" />
              a longo prazo
            </h1>
          </div>
        </div>
      </div>
    </section>


    <section class="homeContentBg is-hidden-mobile">
      <svg width="875" height="595" viewBox="0 0 875 595" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M758.623 125.21C652.43 37.0787 453.411 24.0489 270.056 96.0085C173.087 134.041 83.1704 195.065 48.4476 292.967C-13.6246 467.913 173.952 493.532 294.051 492.924C352.149 492.653 407.681 498.274 459.335 509.419C552.26 529.488 712.444 535.914 810.106 381.754C880.896 270.016 829.285 183.854 758.623 125.21Z" fill="#F0F2F4"/>
      </svg>
    </section>

    <section class="section">
      <div class="container">
        <div class="columns">
          <div class="column is-half is-hidden-mobile">
            <img id="birds" src="~/assets/birds.svg" data-aos="fade-right">
          </div>
          <div class="column is-half textHome" data-aos="fade-left">
            <h2>{{ aboutSection.title }}</h2>
            <p v-html="aboutSection.content" class="text has-text-justified"></p>
            <br />
            <a href="/empresa/institucional" class="more">Ler mais -></a>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
  export default {
    layout: 'lightNav',
    data() {
      return {
        aboutSection: {}
      }
    },
    created() {
      this.$axios.$get('/api/v1/sections/about').then(response => {
        this.aboutSection = response
      })
    }
  }
</script>

<style lang="scss" scoped>
  .textHome {
    margin-top: 4.5rem;
  }

  @media screen and (min-width: 768px), print {
    .textHome {
      margin-top: 9rem;
    }
  }

  .homeHero {
    position: absolute;
    top: 0rem;
    right: 0;
    left: 0;
    z-index: -1;
    & video {
      object-fit: cover;
      width: 100vw;
    }
  }

  @media screen and (min-width: 1900px), print {
    .homeHero {
      right: 0;
    }
  }

  .heroText {
    & .button.saibaMais {
      margin-top: 4rem;
      width: 240px;
      height: 54px;
      background: linear-gradient(102.68deg, rgba(48, 42, 115, 0.8) 0%, #00B0CB 100%);
      box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.25);
      border-radius: 10px;
      border: none;
      font-size: 2rem;
      line-height: 29px;
      color: #ffffff;
      transition: all 0.8s cubic-bezier(0.2, 0.8, 0.2, 1.2) 0s;
      &:hover {
        background-color: #00B0CB;
        transform: translateY(-3px);
        box-shadow: 0px 8px 8px rgba(0, 0, 0, 0.25);
      }
    }
  }

  @media screen and (min-width: 769px), print {
    .heroText {
      margin-top: 4.5rem;
      margin-bottom: 15rem;
      & h1 {
        color: white;
      }
    }
    .navbar-item.has-dropdown {
      color: white;
    }
  }

   @media screen and (min-width: 1470px), print {
    .heroText {
      margin-top: 4.5rem;
      margin-bottom: 20rem;
    }
  }

  .homeContentBg {
    position: absolute;
    left: -16rem;
    z-index: -1;
  }

  @media screen and (min-width: 1900px), print {
    .homeContentBg {
      left: -8rem;
    } 
  }

  #birds {
    max-width: 254px;
    float: right;
    margin-right: 5rem;
    margin-top: 2.5rem;
  }

  @media screen and (min-width: 1900px), print {
    #birds {
      max-width: 254px;
      float: right;
      margin-right: 12rem;
      margin-top: 2.5rem;
    }
  }
</style>