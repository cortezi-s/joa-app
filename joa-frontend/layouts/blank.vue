<template>
	<div>
		<div class="columns is-centered is-gapless">
		  <div class="column is-3">
			  <div class="header">
			    <img src="~/assets/icon.svg" width="95" class="logo" />
			    <div class="has-text-centered">
			      <h1 class="is-size-4 is-size-3">Gerenciamento Website</h1>
			    </div>
			  </div>
			</div>
		</div>
	  <nuxt />
	</div>
</template>

<style>
.header {
  padding-top: 32px;
}

.logo {
  display: block;
  margin-left: auto;
  margin-right: auto;
  padding-bottom: 24px;
}
</style>