<template>
  <div class="box">
    <form @submit.prevent="formSubmitted">
      <b-field label="Título">
        <b-input v-model="section.title" :disabled="successSubmit">
        </b-input>
      </b-field>
      <b-field>
        <wysiwyg
          v-model="section.content"
          :disabled="successSubmit"
        />
      </b-field>
      <b-field>
        <p class="control">
          <button
            type="submit"
            class="button"
            :class="{
              'is-primary': !successSubmit,
              'is-success': successSubmit,
              'is-loading': isSubmitting
            }"
            :disabled="successSubmit"
          >
            <span v-if="successSubmit" class="icon is-small">
              <i class="fas fa-check"></i>
            </span>
            <span>
              {{ submitText }}
            </span>
          </button>
        </p>
      </b-field>
    </form>
  </div>
</template>

<script>
import Vue from 'vue'
import wysiwyg from 'vue-wysiwyg'
Vue.use(wysiwyg, {
  hideModules: { image: true }
})

export default {
  props: {
    section: {
      type: Object,
      default() {
        return {}
      }
    }
  },
  data() {
    return {
      isSubmitting: false,
      successSubmit: false,
      submitText: 'Salvar'
    }
  },
  methods: {
    formSubmitted() {
      this.editSection()
    },
    async editSection() {
      this.isSubmitting = true
      await this.$axios.$patch(
        `/api/v1/admin/sections/${this.section.name}`,
        {
          section: this.section
        }
      )
      this.isSubmitting = false
      this.successSubmit = true
      this.submitText = 'Salvo'
    }
  }
}
</script>
