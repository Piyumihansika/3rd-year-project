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
                    <div class="mr-2"><vs-avatar color="primary" text="Crimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Customer 1</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>30</td>
            <td>
                <label class="label label-danger">Angular</label>
            </td>
            <td>4.9</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="danger" text="Crimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Customer 2</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>30</td>
            <td>
                <label class="label label-info">Vue Js</label>
            </td>
            <td>4.5</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="warning" text="Crimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Customer 3</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>30</td>
            <td>
                <label class="label label-success">Bootstrap</label>
            </td>
            <td>4</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="success" text="Crimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Customer 4</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>30</td>
            <td>
                <label class="label label-purple">React</label>
            </td>
            <td>3.5</td>
         
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