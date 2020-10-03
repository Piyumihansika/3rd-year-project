<template>
  <div class="table-responsive">
    <table class="table v-middle border">
      <thead>
        <tr class="">
          <th class="border-top-0">Buyer</th>
          <th class="border-top-0">Winning Item</th>
          <th class="border-top-0">Max Bid</th>
          <th class="border-top-0">Customer</th>
          <th class="border-top-0">Rating</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="items in allItems" :key="items._id">
          <td>
            <div class="d-flex align-items-center">
              <div class="mr-2">
                <vs-avatar color="primary" text="Buyer 1" />
              </div>
              <div class="">
                <h5 class="m-b-0">{{ items.category }}</h5>
              </div>
            </div>
          </td>
        </tr>
      </tbody>
      <!-- <tbody>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="primary" text="Buyer 1" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 01</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>25</td>
            <td>
                <label class="label label-danger">Customer 04</label>
            </td>
            <td>4.5</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="danger" text="Buyer 2" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 02</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>25</td>
            <td>
                <label class="label label-info">Customer 02</label>
            </td>
            <td>4</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="warning" text="Buyer 3" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 03</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>15</td>
            <td>
                <label class="label label-success">Customer 01</label>
            </td>
            <td>3</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="success" text="Buyer 4" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 04</h5>
                    </div>
                </div>
            </td>
            <td></td>
            <td>10</td>
            <td>
                <label class="label label-purple">Customer 03</label>
            </td>
            <td>2.2</td>
         
        </tr>
    </tbody> -->
    </table>
    <p>
      chamindu udesh
      {{ allItems[0].category }}
      i love u
    </p>
  </div>
</template>
<script>
import Axios from "axios";
export default {
  name: "TopBuyers",

  data() {
    return {
      allItems: {},
    };
  },

  mounted() {
    Axios.get("http://localhost:3000/item//viewAllItems").then((response) => {
      this.allItems = response.data;

      //  console.log(response.data);
    });
  },
};
</script>