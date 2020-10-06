<template>
<div class="table-responsive">    
<table class="table v-middle border">
    <thead>
        <tr class="">
            <th class="border-top-0">Customer</th>
            <th class="border-top-0">Top Bid Item</th>
            <th class="border-top-0">Max Bid</th>
            <th class="border-top-0">Buyer</th>
            <th class="border-top-0">Rating</th>
        </tr>
    </thead>
     <tbody>
        <tr v-for="customers in allCustomers" :key="customers._id">
          <td>
            <div class="d-flex align-items-center">
              <div class="mr-2">
                <vs-avatar color="primary" text="Buyer 1" />
              </div>
              <div class="">
                <h5 class="m-b-0">{{ customers.firstName }}  {{customers.lastName}}</h5>
              </div>
            </div>
          </td>
          <td>
            <div class="d-flex align-items-center">
              <!-- <div class="mr-2">
                <vs-avatar color="primary" text="Buyer 1" />
              </div> -->
              <div class="">
                <!-- <h5 class="m-b-0">{{ buyers. }}</h5> -->
              </div>
            </div>
          </td>
        </tr>
      </tbody>
    <!-- <tbody>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="primary" text="Crimary 1" /></div>
                    <div class="">
                        <h5 class="m-b-0">{{allCustomers[0].firstName}}</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>30</td>
            <td>
                <label class="label label-danger">Buyer 03</label>
            </td>
            <td>4.9</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="danger" text="Crimary 2" /></div>
                    <div class="">
                        <h5 class="m-b-0"> Customer 02</h5>
                    </div>
                </div>
            </td>
            <td> </td>
            <td>30</td>
            <td>
                <label class="label label-info">Buyer 04</label>
            </td>
            <td>4.5</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="warning" text="Crimary 3" /></div>
                    <div class="">
                        <h5 class="m-b-0">Customer 03</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>30</td>
            <td>
                <label class="label label-success">Buyer 04</label>
            </td>
            <td>4</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="success" text="Crimary 4" /></div>
                    <div class="">
                        <h5 class="m-b-0">Customer 04</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>30</td>
            <td>
                <label class="label label-purple">Buyer 01</label>
            </td>
            <td>3.5</td>
         
        </tr>
    </tbody> -->
</table>
</div>
</template>

<script>
import Axios from "axios";
export default {
  name: "TopCustomers",

  data() {
    return {
      allCustomers: {},
    };
  },

  mounted() {
    Axios.get("http://localhost:3000/customer//viewAllCustomer").then((response) => {
      this.allCustomers = response.data;


      //  console.log(response.data);
    });
  },
};
</script>