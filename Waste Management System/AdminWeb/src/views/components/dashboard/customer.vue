<template>
<vs-col vs-lg="12">
 <vs-col vs-lg="12">
      <vs-card>
        <div slot="header">
          <h3>Customer</h3>
          <br>
          <h5></h5>
        </div>
        <!-- <TopProducts/> -->
      </vs-card>
 
        <div class="table-responsive">    
        <table class="table v-middle border">
            <thead>
                <tr class="">
                    <th class="border-top-0"> Customer Name</th>
                    <th class="border-top-0">Customer Level</th>
                    <th class="border-top-0">Address</th>
                    <th class="border-top-0">Email</th>
                    <th class="border-top-0">Contact Number</th>
                    <th class="border-top-0"></th>
                    <th class="border-top-0">Earnings</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="customers in customerDetails" :key="customers._id">
                <td>
                    <div class="d-flex align-items-center">
                    <div class="mr-2">
                        <!-- <vs-avatar color="primary" text= {{customers.id}} /> -->
                    </div>
                    <div class="">
                        <h5 class="m-b-0">{{ customers.firstName }}  {{customers.lastName}}</h5>
                    </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    <div class="">
                        <h5 class="m-b-0"> Awlk na </h5>
                    </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    <div class="">
                        <h5 class="m-b-0">{{ customers.address1 }} {{ customers.address2 }} <br> {{ customers.city }}<br> {{ customers.district }}</h5>
                    </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    <div class="">
                        <h5 class="m-b-0">{{ customers.email }}</h5>
                    </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    <div class="">
                        <h5 class="m-b-0">{{ customers.contactNumber }}</h5>
                    </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    <div class="">
                        <h5 class="m-b-0"></h5>
                    </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    <div class="">
                        <h5 class="m-b-0"> danne na </h5>
                    </div>
                    </div>
                </td>
                </tr>
            </tbody>
        </table>
        </div>
        <br><br>
</vs-col>
<br>

    </vs-col>
</template>


<script>
import Axios from "axios";
export default {
  name: "Customer",

  data() {
    return {
      customerDetails: {},
    };
  },

  mounted() {
    Axios.get("http://localhost:3000/customer//viewAllCustomer").then((response) => {
      this.customerDetails = response.data;


      //  console.log(response.data);
    });
  },
};

</script>