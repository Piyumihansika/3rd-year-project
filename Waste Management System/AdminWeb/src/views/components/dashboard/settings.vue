<template>

          <vs-row vs-justify="right">
          <vs-col type="flex" vs-justify="right" vs-align="right" vs-w="10" vs-sm="12">
          <vs-card>
          <div slot="header">
          <h3>
          Admin Accounts
          </h3>
          </div>
          <div>
                You can add, view , delete admins here <br><br>
                <table class="table v-middle border">
                 <thead>
                    <tr class="">
                        <th class="border-top-0">Admin Name</th>
                        <th class="border-top-0">Admin Email</th>
                        <th class="border-top-0">Contact Number</th>
                        <!-- <th class="border-top-0">Email</th> -->
                        <!-- <th class="border-top-0">Contact Number</th> -->
                        <th class="border-top-0"></th>
                        <th class="border-top-0">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="admins in adminDetails" :key="admins._id">
                    <td>
                        <div class="d-flex align-items-center">
                        <div class="mr-2">
                            <vs-avatar color="danger" text="A" />
                        </div>
                        <div class="">
                            <h5 class="m-b-0">{{ admins.adminName }}</h5>
                        </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0">{{ admins.adminemail }}</h5>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="">
                                <h5 class="m-b-0">{{ admins.admincontactNumber }}</h5>
                            </div>
                        </div>
                    </td>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="">
                                <!-- <h5 class="m-b-0">{{ admins.admincontactNumber }}</h5> -->
                            </div>
                        </div>
                    </td>
                    <td>
                        <vs-button class="mr-2" type="gradient" color="danger" lable = "Delete" icon="delete"></vs-button>
                        <!-- <vs-button class="mr-2" color="primary" icon="add"></vs-button> -->
                        <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
                    </td>


                    </tr>
                </tbody>
                </table>
          </div>
           <div slot="footer">
          <vs-row vs-justify="flex-end">
          <!-- <vs-button class="mr-2" type="gradient" color="danger" icon="delete"></vs-button> -->
          <vs-button class="mr-2" color="primary" icon="add"></vs-button>
           <!-- <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button> -->
          </vs-row>
          </div> 
          </vs-card>
          </vs-col>
            <vs-divider/>

         <vs-col type="flex" vs-justify="right" vs-align="right" vs-w="12" vs-sm="12">
          <vs-card>
          <div slot="header">
          <h3>
          Customer Accounts</h3>
          
          </div>
      <div>
            You can add, view , delete customer here
            <br>
            <br>
            <div class="table-responsive">    
        <table class="table v-middle border">
            <thead>
                <tr class="">
                    <th class="border-top-0">Customer Name</th>
                    <th class="border-top-0">Customer Level</th>
                    <th class="border-top-0">Address</th>
                    <th class="border-top-0">Email</th>
                    <th class="border-top-0">Contact Number</th>
                    <th class="border-top-0"></th>
                    <th class="border-top-0">Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="customers in customerDetails" :key="customers._id">
                <td>
                    <div class="d-flex align-items-center">
                    <div class="mr-2">
                        <vs-avatar color="primary" text= "Customer" />
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
                        <!-- <h5 class="m-b-0"> danne na </h5> -->
                        <vs-button class="mr-2" type="gradient" color="danger" lable = "Delete" icon="delete"></vs-button>
                        <!-- <vs-button class="mr-2" color="primary" icon="add"></vs-button> -->
                        <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
                    </div>
                    </div>
                </td>
                </tr>
            </tbody>
        </table>
            </div>    
          </div>
          <div slot="footer">
          <vs-row vs-justify="flex-end">
          <!-- <vs-button class="mr-2" type="gradient" color="danger" icon="delete"></vs-button> -->
          <vs-button class="mr-2" color="primary" icon="add"></vs-button>
          <!-- <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button> -->
          </vs-row>
          </div>
          </vs-card>
          </vs-col>
            <vs-divider/>


         <vs-col type="flex" vs-justify="right" vs-align="right" vs-w="12" vs-sm="12">
          <vs-card>
          <div slot="header">
          <h3>
          Buyer Accounts
          </h3>
          </div>
          <div>
                You can add, view, delete buyer here


            <vs-col vs-lg="12">
                <vs-col vs-lg="12">
                    <vs-card>
                        <div slot="header">
                        <!-- <h3>Buyer</h3> -->
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
                                    <th class="border-top-0">Actions</th>
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
                                            <!-- <h5 class="m-b-0"> danne na </h5> -->
                                            <vs-button class="mr-2" type="gradient" color="danger" lable = "Delete" icon="delete"></vs-button>
                                            <!-- <vs-button class="mr-2" color="primary" icon="add"></vs-button> -->
                                            <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
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
                                    <th class="border-top-0">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="companies in companyDetails" :key="companies._id">
                                    <td>
                                        <div class="d-flex align-items-center">
                                        <div class="mr-2">
                                        <vs-avatar color="#18cd5b" color-text="rgb(50,50,50)" text= "Buyer" />
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
                                                <!-- <h5 class="m-b-0"> danne na </h5> -->
                                                <vs-button class="mr-2" type="gradient" color="danger" lable = "Delete" icon="delete"></vs-button>
                                                <!-- <vs-button class="mr-2" color="primary" icon="add"></vs-button> -->
                                                <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
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
          </div>
          <div slot="footer">
          <vs-row vs-justify="flex-end">
          <!-- <vs-button class="mr-2" type="gradient" color="danger" icon="delete"></vs-button> -->
          <vs-button class="mr-2" color="primary" icon="add"></vs-button>
          <!-- <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button> -->
          </vs-row>
          </div>
          </vs-card>
          </vs-col>
            <vs-divider/>
          </vs-row>
</template>
<script>
import Axios from "axios";
export default {
  name: "Settings",

  data() {
    return {
      buyerDetails: {},
      companyDetails: {},
      adminDetails: {},
      customerDetails: {},
    };
  },

  mounted() {
        Axios.get("http://localhost:3000/company/viewAllCompanies").then((response) => {
        this.companyDetails = response.data;
        //  console.log(response.data);
    })

    Axios.get("http://localhost:3000/admin/viewAllAdmin").then((response) => {
        this.adminDetails = response.data;
        //  console.log(response.data);
    })

    Axios.get("http://localhost:3000/customer//viewAllCustomer").then((response) => {
        this.customerDetails = response.data;
        //  console.log(response.data);
    })


    Axios.get("http://localhost:3000/buyer/viewAllBuyers").then((response) => {
      this.buyerDetails = response.data;
    //  console.log(companyDetails);  
    });
    
  },
};


</script>