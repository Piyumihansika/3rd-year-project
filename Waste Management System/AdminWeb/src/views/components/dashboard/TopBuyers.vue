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
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="primary" text="Brimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 1</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>25</td>
            <td>
                <label class="label label-danger">Angular</label>
            </td>
            <td>4.5</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="danger" text="Brimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 2</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>25</td>
            <td>
                <label class="label label-info">Vue Js</label>
            </td>
            <td>4</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="warning" text="Brimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 3</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>25</td>
            <td>
                <label class="label label-success">Bootstrap</label>
            </td>
            <td>3</td>
           
        </tr>
        <tr>
            <td>
                <div class="d-flex align-items-center">
                    <div class="mr-2"><vs-avatar color="success" text="Brimary" /></div>
                    <div class="">
                        <h5 class="m-b-0">Buyer 4</h5>
                    </div>
                </div>
            </td>
            <td>Single Use</td>
            <td>25</td>
            <td>
                <label class="label label-purple">React</label>
            </td>
            <td>2.5</td>
         
        </tr>
    </tbody>
</table>
</div>
</template>
<script>
export default {
    name: "TopBuyers"
}
</script>