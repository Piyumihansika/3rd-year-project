  <template lang="html">
            <div class="centerx">
            <vs-button @click="popupActivo2=true" color="primary" type="filled"> Login</vs-button>
            <vs-popup classContent="popup-example" title="Admin Login Page" :active.sync="popupActivo2">
                <p>
            Enter your email
            </p>
            <vs-input class="inputx" placeholder="Email" v-model="value1"/>
            <br>
            <p>
            Enter your password
            </p>

            <vs-input class="inputx" placeholder="Password" v-model="value2"/>
            <br>
            
            <!-- <vs-select
            label="Figuras" v-model="select1"> -->
            <vs-select-item :key="index" :value="item.value" :text="item.text" v-for="item,index in options1" />
            </vs-select>
            <vs-button @click="popupActivo3=true" color="primary" type="filled">Log In</vs-button>
            
            </vs-popup>
            </div>
</template>

<script>
export default {
     data(){
            return {
            select1:3,
            options1:[
            {text:'IT',value:0},
            {text:'Blade Runner',value:2},
            {text:'Thor Ragnarok',value:3},
            ],
            value1:'',
            value2:'',
            popupActivo2:false,
            popupActivo3:false
            }
            }
    
}
</script>