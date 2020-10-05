<template>
  <div>
    <vs-navbar  v-model="activeItem" class="nabarx">
      <div slot="title">
        <vs-navbar-title>
          Green Wasteland
        </vs-navbar-title>
      </div>
      <vs-navbar-item index="0">
       
           <a href="/new/Starterkit">Home</a>
    
       
      </vs-navbar-item>  


      
      <vs-navbar-item index="1">
        <a href="#">News</a>
      </vs-navbar-item>
      <vs-navbar-item index="2">
        <a href="#">Update</a>
      </vs-navbar-item>
      <vs-navbar-item v-for="links in links" :key="links.title" @click="$router({path: links.route})">
     <vs-button color="success" type="filled" :to="{ path: links.route }">{{links.title}}</vs-button>

      </vs-navbar-item>

    
        <vs-navbar-item index="3">
        <div>
    <vs-navbar collapse v-model="activeItem" class="nabarx">
      <vs-navbar-item index="0">
        <a href="#">Contact US</a> 
      </vs-navbar-item>
      <!-- <vs-navbar-item index="1" v-for="link in links" :key="link.key" :to="link.url">
        {{link.name}}
      </vs-navbar-item> -->
   
    </vs-navbar>
  </div>
    </vs-navbar-item>


    </vs-navbar>


  </div>
</template>



<script>

// import StarterPage from '../StarterPage.vue'
export default {
name:"publicHeader",

    data:()=>({
    activeItem: 0,

    links: [
      {title: "Admin Login", route: "/login"},
      {title: "home", route: "/Homepage"}
    ]


  }),
 


  components: {
            // StarterPage
           
           }

}
</script>

<style>

</style>