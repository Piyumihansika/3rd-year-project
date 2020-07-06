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
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="success" text="C4" /></div>
                            <div class="">
                                <h5 class="m-b-0">Customer 04</h5>
                            </div>
                        </div>
                    </td>
                    <td>07</td>
                    <td>'jkl', Main rd, Panadura</td>
                    <td>
                        <label class="label label-purple">customer04@gmail.com</label>
                    </td>
                    <td>0761122335</td>
                    <td><vs-button radius color="danger" type="gradient" icon="delete"></vs-button></td>
                    <td>
                        <h5 class="m-b-0"></h5>
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

export default {
    name: "Customer"
}

</script>