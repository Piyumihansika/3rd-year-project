<template>
<vs-col vs-lg="12">
    <vs-col vs-lg="12">
        <vs-card>
            <div slot="header">
            <h3>Buyer</h3>
            <br>
            <h5>Household Buyers</h5>
            </div>
            <!-- <TopProducts/> -->
        </vs-card>
    
            <div class="table-responsive">    
            <table class="table v-middle border">
                <thead>
                    <tr class="">
                        <th class="border-top-0">Buyer Name</th>
                        <th class="border-top-0">Buyer Level</th>
                        <th class="border-top-0">Address</th>
                        <th class="border-top-0">Email</th>
                        <th class="border-top-0">Contact Number</th>
                        <th class="border-top-0"></th>
                        <th class="border-top-0">Earnings</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="buyers in buyerDetails" :key="buyers._id">
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="mr-2">
                                <vs-avatar color="primary" text= "Buyer" />
                            </div>
                            <div class="">
                                <h5 class="m-b-0">{{ buyers.firstName }}  {{buyers.lastName}}</h5>
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
                                <h5 class="m-b-0"> {{ buyers.address1 }}, {{ buyers.address2 }},<br> {{ buyers.city }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0"> {{ buyers.email }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0"> {{ buyers.contactNumber }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0"> </h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0">  hadann one </h5>
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
  <vs-col vs-lg="12">
        <vs-card>
            <div slot="header">
            <!-- <h3>Buyer</h3>
            <br> -->
            <h5>Company Buyers</h5>
            </div>
            <!-- <TopProducts/> -->
        </vs-card>
    
            <div class="table-responsive">    
            <table class="table v-middle border">
                <thead>
                    <tr class="">
                        <th class="border-top-0">Company Name</th>
                        <th class="border-top-0">Buyer Level</th>
                        <th class="border-top-0">Address</th>
                        <th class="border-top-0">Email</th>
                        <th class="border-top-0">Contact Person Name</th>
                        <th class="border-top-0">Contact Person Number</th>
                        <th class="border-top-0">Earnings</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="companies in companyDetails" :key="companies._id">
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="mr-2">
                              <vs-avatar color="primary" text= "Buyer" />
                            </div>
                            <div class="">
                                <h5 class="m-b-0">{{ companies.companyName }}</h5>
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
                                <h5 class="m-b-0"> {{ companies.address1 }}, {{ companies.address2 }}<br> {{ companies.city }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0"> {{ companies.email }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0"> {{ companies.contactpersonName }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0"> {{ companies.contactpersonNumber }}</h5>
                            </div>
                            </div>
                        </td>
                        <td>
                            <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0">  hadann one </h5>
                            </div>
                            </div>
                        </td>
                </tr>
                </tbody>
            </table>
            </div>
            <br><br>
    </vs-col>    

</vs-col>
</template>


<script>
import Axios from "axios";
export default {
  name: "Buyer",

  data() {
    return {
      buyerDetails: {},
      companyDetails: {},
    };
  },

  mounted() {
        Axios.get("http://localhost:3000/company/viewAllCompanies").then((response) => {
        this.companyDetails = response.data;
        //  console.log(response.data);
    })
    Axios.get("http://localhost:3000/buyer/viewAllBuyers").then((response) => {
      this.buyerDetails = response.data;
    //  console.log(companyDetails);  
    });
    
  },
};


</script>