<template>
 <div>
  <States/>
 <vs-row vs-justify="center">
    <vs-col type="flex" vs-justify="center" vs-align="center" vs-lg="8" vs-sm="6" vs-xs="12" code-toggler>
      <vs-card class="cardx">
        <div slot="header">
          <h4>
            Sales Summary
          </h4>
        </div>
        <div>
          <SalesSummary/>
        </div>
        
      </vs-card>
    </vs-col>
    <vs-col type="flex" vs-justify="center" vs-align="center" vs-sm="6" vs-lg="4" vs-xs="12">
      <vs-card class="cardx">
        <div slot="header">
          <h4>
           Commissions 
          </h4>
        </div>
        <div>
          <SalesIncome/>
        </div>
      </vs-card>

    </vs-col>
    <vs-col vs-lg="12">
      <vs-card>
        <div slot="header">
          <h4>Top Rating Buyers</h4>
        </div>
        <TopBuyers/>
      </vs-card>
    </vs-col>
     <vs-col vs-lg="12">
      <vs-card>
        <div slot="header">
          <h4>Top Rating Customers</h4>
        </div>
        <TopCustomers/>
      </vs-card>
    </vs-col>
  </vs-row>
  <!-- <Blogs/> -->
</div>  
</template>

<script>
import SalesSummary from './components/dashboard/SalesSummary.vue';
import SalesIncome from './components/dashboard/SalesIncome.vue';
import TopBuyers from './components/dashboard/TopBuyers.vue';
import TopCustomers from './components/dashboard/TopCustomers.vue';
import States from './components/dashboard/States.vue';
// import Blogs from './components/dashboard/Blogs.vue';

export default {
	name: 'StarterPage',
  components: {
    SalesSummary,
    SalesIncome,
    TopBuyers,
    TopCustomers,
    States,
    
  }
}
</script>
