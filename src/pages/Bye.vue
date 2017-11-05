<template lang="pug">
.bye
  button(@click="load") load
  ul(v-for="company in companies")
    li {{company.name}}
  router-link(:to="{ name: 'top'}") TOP
</template>

<script lang="coffee">
export default
  data: ->
    companies: []
  methods:
    load: ->
      axios.get('/api/companies.json')
        .then (responce) =>
          @companies = responce.data
</script>

<style lang="stylus" scoped>
.bye
  -webkit-font-smoothing: antialiased
  -moz-osx-font-smoothing: grayscale
  text-align: center
  margin-top: 60px

  h1
    font-weight: normal
  a
    color: #42b983
</style>
