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
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                        <div class="mr-2"><vs-avatar  src=" @/src/assets/images/user/2.jpg"/>
                        <!-- <vs-avatar size="large> -->
                        </div>
                            <div class="">
                                <h5 class="m-b-0">Buyer 01</h5>
                            </div>
                        </div>
                    </td>
                    <td>05</td>
                    <td>No 01, Main rd, Colombo 07</td>
                    <td>
                        <label class="label label-danger">buyer01@gmail.com </label>
                    </td>
                    <td>0712232569</td>
                    <td></td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="danger" text="Mrimary" /></div>
                            <div class="">
                                <h5 class="m-b-0">Buyer 02</h5>
                            </div>
                        </div>
                    </td>
                    <td>07</td>
                    <td>No 02, Main rd, Colombo 07</td>
                    <td>
                        <label class="label label-info">buyer02@gmail.com</label>
                    </td>
                    <td>0752255885</td>
                    <td></td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="warning" text="Primary" /></div>
                            <div class="">
                                <h5 class="m-b-0">Buyer 03</h5>
                            </div>
                        </div>
                    </td>
                    <td>03</td>
                    <td>No 03, Main rd, Colombo 07</td>
                    <td>
                        <label class="label label-success">buyer03@gmail.com</label>
                    </td>
                    <td>0782233665</td>
                    <td></td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="success" text="Arimary" /></div>
                            <div class="">
                                <h5 class="m-b-0">Buyer 04</h5>
                            </div>
                        </div>
                    </td>
                    <td>07</td>
                    <td>No 04, Main rd, Colombo 07</td>
                    <td>
                        <label class="label label-purple">buyer04@gmail.com</label>
                    </td>
                    <td>0761122335</td>
                    <td></td>
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


<vs-col vs-lg="12">
        <vs-card>
        <div slot="header">
          <h5>Company Buyers</h5>
          <br>
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
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                        <div class="mr-2"><vs-avatar  src=" @/src/assets/images/user/2.jpg"/>
                        <!-- <vs-avatar size="large> -->
                        </div>
                            <div class="">
                                <h5 class="m-b-0">Company 01</h5>
                            </div>
                        </div>
                    </td>
                    <td>03</td>
                    <td>Company 01,Colombo</td>
                    <td>
                        <label class="label label-danger">company01@gmai.com</label>
                    </td>
                    <td>Mr. Sarath</td>
                    <td>0712222222</td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="danger" text="Mrimary" /></div>
                            <div class="">
                                <h5 class="m-b-0">Company 02 </h5>
                            </div>
                        </div>
                    </td>
                    <td>05</td>
                    <td>Company 02,Colombo</td>
                    <td>
                        <label class="label label-info">company02@gmail.com</label>
                    </td>
                    <td>Mr. Kamal</td>
                    <td>0771111111</td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="warning" text="Primary" /></div>
                            <div class="">
                                <h5 class="m-b-0"> Company 03 </h5>
                            </div>
                        </div>
                    </td>
                    <td>04</td>
                    <td>Company 03,Colombo</td>
                    <td>
                        <label class="label label-success">company03@gmail.com</label>
                    </td>
                    <td>Mr. Namal</td>
                    <td>0771234567</td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="d-flex align-items-center">
                            <div class="mr-2"><vs-avatar color="success" text="Arimary" /></div>
                            <div class="">
                                <h5 class="m-b-0">Company 04</h5>
                            </div>
                        </div>
                    </td>
                    <td>06</td>
                    <td>Company 04,Colombo</td>
                    <td>
                        <label class="label label-purple">company04@gmail.com</label>
                    </td>
                    <td>Mr. Saman</td>
                    <td>0711234567</td>
                    <td>
                        <h5 class="m-b-0"></h5>
                    </td>
                </tr>
            </tbody>
        </table>
        </div>
</vs-col>
</vs-col>
</template>


<script>

export default {
    name: "Buyer"
}

</script>