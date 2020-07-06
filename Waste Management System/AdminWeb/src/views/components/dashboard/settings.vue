<template>

          <vs-row vs-justify="right">
          <vs-col type="flex" vs-justify="right" vs-align="right" vs-w="6" vs-sm="12">
          <vs-card>
          <div slot="header">
          <h3>
          Admin Accounts
          </h3>
          </div>
          <div>
                You can add, view , delete admins here
          </div>
          <div slot="footer">
          <vs-row vs-justify="flex-end">
          <vs-button class="mr-2" type="gradient" color="danger" icon="delete"></vs-button>
          <vs-button class="mr-2" color="primary" icon="add"></vs-button>
          <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
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
                    <th class="border-top-0">Earnings</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                        <div class="mr-2"><vs-avatar  text = "C1" />
                        <!-- <vs-avatar size="large> -->
                        </div>
                            <div class="">
                                <h5 class="m-b-0">Customer 01</h5>
                            </div>
                        </div>
                    </td>
                    <td>05</td>
                    <td>'abc', Main Rd,Matara</td>
                    <td>
                        <label class="label label-danger">customer01@gmail.com </label>
                    </td>
                    <td>0701111111</td>
                    <td><vs-button radius color="danger" type="gradient" icon="delete"></vs-button></td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="danger" text="C2" /></div>
                            <div class="">
                                <h5 class="m-b-0">Customer 02</h5>
                            </div>
                        </div>
                    </td>
                    <td>07</td>
                    <td>'def', Main Rd, Galle</td>
                    <td>
                        <label class="label label-info">customer02@gmail.com</label>
                    </td>
                    <td>0719988774</td>
                    <td>
                        <vs-button radius color="danger" type="gradient" icon="delete"></vs-button>
                        <!-- <vs-button radius color="primary" type="gradient" icon="person"></vs-button> -->
                    </td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="warning" text="C3" /></div>
                            <div class="">
                                <h5 class="m-b-0">Customer 03</h5>
                            </div>
                        </div>
                    </td>
                    <td>03</td>
                    <td>'ghi', Main rd, Colombo</td>
                    <td>
                        <label class="label label-success">customer03@gmail.com</label>
                    </td>
                    <td>0762255888</td>
                    <td><vs-button radius color="danger" type="gradient" icon="delete"></vs-button></td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
             </tbody>
        </table>
            </div>
                You can add, view , delete customer here
          </div>
          <div slot="footer">
          <vs-row vs-justify="flex-end">
          <vs-button class="mr-2" type="gradient" color="danger" icon="delete"></vs-button>
          <vs-button class="mr-2" color="primary" icon="add"></vs-button>
          <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
          </vs-row>
          </div>
          </vs-card>
          </vs-col>
            <vs-divider/>


                      <vs-col type="flex" vs-justify="right" vs-align="right" vs-w="6" vs-sm="12">
          <vs-card>
          <div slot="header">
          <h3>
          Buyer Accounts
          </h3>
          </div>
          <div>
                You can add, view, delete buyer here
          </div>
          <div slot="footer">
          <vs-row vs-justify="flex-end">
          <vs-button class="mr-2" type="gradient" color="danger" icon="delete"></vs-button>
          <vs-button class="mr-2" color="primary" icon="add"></vs-button>
          <vs-button color="#18cd5b" color-text="rgb(50,50,50)" icon="person"></vs-button>
          </vs-row>
          </div>
          </vs-card>
          </vs-col>
            <vs-divider/>
          </vs-row>
</template>
<script>
export default {
    
}
</script>