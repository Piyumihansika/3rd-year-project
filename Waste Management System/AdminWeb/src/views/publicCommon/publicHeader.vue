<template>
  <div>
    <vs-navbar collapse v-model="activeItem" class="nabarx">
      <div slot="title">
        <vs-navbar-title>
          Green Wasteland
        </vs-navbar-title>
      </div>
      <vs-navbar-item index="0">
        <router-link to="/starterkit">
           <a href="Starterkit">Home</a>
        </router-link>
       
      </vs-navbar-item>  
      <vs-navbar-item index="1">
        <a href="#">News</a>
      </vs-navbar-item>
      <vs-navbar-item index="2">
        <a href="#">Admin Login</a>
      </vs-navbar-item>
     
    </vs-navbar>
  </div>
</template>



<script>
export default {

    data:()=>({
    activeItem: 0
  })

}
</script>

<style>

</style>