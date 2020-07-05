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
          </vs-row>
</template>
<script>
export default {
    
}
</script>