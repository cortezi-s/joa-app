<template>
  <div>
    <div class="box">
      <nav class="level">
        <div class="level-left">
          <div class="level-item">
            <p class="title is-size-2">Seções</p>
          </div>
        </div>
        <div class="level-right">
          <div class="level-item">
            <b-button
              v-if="formIsCurrentTab"
              type="is-warning"
              @click="showButtonHandler"
            >
              Ver Lista
            </b-button>
          </div>
        </div>
      </nav>
    </div>
    <component
      :is="currentTabComponent"
      :section="editSection"
      @edit:section="editButtonHandler($event)"
    >
    </component>
  </div>
</template>

<script>
import SectionForm from '~/components/SectionForm'
import SectionList from '~/components/SectionList'

export default {
  name: 'SectionAdmin',
  layout: 'admin',
  components: {
    SectionForm,
    SectionList
  },
  data() {
    return {
      currentTabComponent: 'SectionList',
      formIsCurrentTab: false,
      editSection: {}
    }
  },
  methods: {
    showButtonHandler() {
      this.currentTabComponent = 'SectionList'
      this.formIsCurrentTab = false
    },
    editButtonHandler(section) {
      this.formIsCurrentTab = true
      this.currentTabComponent = 'SectionForm'
      this.editSection = section
    }
  }
}
</script>
