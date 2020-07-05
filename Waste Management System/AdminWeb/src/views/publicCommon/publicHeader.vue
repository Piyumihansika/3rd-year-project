<template>
  <div>
    <vs-navbar v-model="activeItem" class="nabarx">
      <div slot="title">
        <vs-navbar-title>
          Green Wasteland
        </vs-navbar-title>
      </div>

      <vs-navbar-item index="0">
        <a href="#">Home</a>
      </vs-navbar-item>
      <vs-navbar-item index="1">
        <a href="#">News</a>
      </vs-navbar-item>
      <vs-navbar-item index="2">
        <a href="#">Update</a>
      </vs-navbar-item>
        <vs-navbar-item index="3">
        <div>
    <vs-navbar collapse v-model="activeItem" class="nabarx">
      

      <vs-navbar-item index="0">
        <a href="#">Contact US</a>
      </vs-navbar-item>
      <vs-navbar-item index="1">
        <a href="#">Admin login</a>
      </vs-navbar-item>
      <vs-navbar-item index="2">
        <router-link to="../StarterPage.vue">Admin login</router-link>
      </vs-navbar-item>
      
      
    </vs-navbar>
  </div>
    </vs-navbar-item>


    </vs-navbar>
  </div>
</template>



<script>

import StarterPage from '../StarterPage.vue'
export default {

    data:()=>({
    activeItem: 0
  }),


  components: {
            StarterPage
           
           }

}
</script>

<style>

</style>