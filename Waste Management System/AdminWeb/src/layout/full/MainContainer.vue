<template>
	<div class="main-wrapper">
		<!---Navigation-->
		<Navbar :topbarColor="topbarColor" :logo="require('@/assets/images/logo/one.png')" :title="logotitle" />
		<!---Sidebar-->
		<SideBar parent=".main-wrapper" :sidebarLinks="sidebarLinks"/>
		<!---Page Container-->
		<div class="main-container-fluid">
		
		<router-view></router-view>

		
		</div>	
	</div>
</template>

<script>
 
import Navbar from '@/layout/full/header/Navbar.vue';
import SideBar from '@/layout/full/sidebar/SideBar.vue';
import sidebarLinks from '@/layout/full/sidebar/sidebarlinks.js';

export default {
name: "MainContainer",
components: {
Navbar,
SideBar

},
data:() => ({
	topbarColor: "#2962ff",
	logotitle: "Green Wasteland",
	sidebarLinks: sidebarLinks,
}),
methods: {
	
},



}  	
</script>