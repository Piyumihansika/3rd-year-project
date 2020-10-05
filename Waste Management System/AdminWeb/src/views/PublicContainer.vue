<template>
  
    <div class="main-wrapper">

        <publicHeader :headerlinks="headerlinks"/>


    <div class="main-container-fluid">
		
		<router-view></router-view>

		
		</div>	

    </div> 

    

</template>

<script>

    import publicHeader from '@/views/publicCommon/publicHeader.vue';
    import headerlinks from '@/views/publicCommon/headerlinks.js';

export default {

    name: "PublicContainer",
    components: {
        publicHeader,
        },

    data:() => ({
	
	headerlinks: headerlinks,
}),

}
</script>

<style>

</style>