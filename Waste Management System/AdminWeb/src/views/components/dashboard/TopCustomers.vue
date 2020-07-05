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
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="primary" text="Erimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Elite Admin</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>John Doe</td>
            <td>
                <label class="label label-danger">Angular</label>
            </td>
            <td>46</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="danger" text="Mrimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Monster Admin</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>Venessa Fern</td>
            <td>
                <label class="label label-info">Vue Js</label>
            </td>
            <td>46</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="warning" text="Primary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Material Pro Admin</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>John Doe</td>
            <td>
                <label class="label label-success">Bootstrap</label>
            </td>
            <td>46</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="success" text="Arimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Ample Admin</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>John Doe</td>
            <td>
                <label class="label label-purple">React</label>
            </td>
            <td>46</td>
         
        </tr>
    </tbody>
</table>
</div>
</template>
<script>
export default {
    name: "TopCustomers"
}
</script>