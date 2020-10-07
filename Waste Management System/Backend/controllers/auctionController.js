const {Router} = require('express');
const router = Router();

const Auction = require('../model/auctionModel.js');
const FinalBid = require('../model/finalBidModel.js')
const Item = require('../model/itemModel');

router.post('/addBid', async(req,res) => {

    try{
        const bidList = await Auction.find({itemId : req.body.itemId});
        const item = await Item.findOne({price: req.body.bidValue})
        // if(item)
        console.log("--------------------------------------"+item)
        var results = []
        for(var i=0; i<bidList.length; i++){
            
            results.push(bidList[i].bidValue)
            // results.push(bidList[i].customerId)
        }
        const maxbid = Math.max(...results)
        console.log(maxbid)
        if(req.body.bidValue > maxbid ){

            const {customerId, itemId, biddingTime, buyerId, bidValue} = req.body;
            const auction = new Auction({
               customerId, itemId, biddingTime, buyerId, bidValue
            });
            await auction.save();
            res.status(200).json(auction);
            // console.log(auction);

        }else{
            res.status(403).json({"message" : "Please add a bid more than the max bid"})
        }
     
       
    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem in the bid');
    }
})

router.get('/maxBid/:itemId', async(req,res) => {
    
    const bidList = await Auction.find({itemId : req.params.itemId});
    if(bidList.length == 0){

        const maxBid = "0"
        res.status(403).json(maxBid)
       console.log(maxBid)

 
    }else{
       
       var results = []
       for(var i=0; i<bidList.length; i++){
           
           results.push(bidList[i].bidValue)
           // results.push(bidList[i].customerId)
       }
       const maxbid = Math.max(...results)
       const details = await Auction.findOne({bidValue: maxbid})
       res.status(200).json(details);
    //    console.log(details)
   

    }

    
})

router.post('/addFinalBid', async(res,req) => {

    try{
        const {customerId, itemId, biddingTime, buyerId, bidValue} = details;
        const finalBid = new FinalBid({
           customerId, itemId, biddingTime, buyerId, bidValue
        });
        await finalBid.save();
        
    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem in the bid');
    }

})

//bidding items for buyer
router.get("/biddingItems/:id", async(req,res) => {
    const items = await Auction.find( {buyerId : req.params.id} )
    res.status(200).json({"items":items})
   
})

//bidding items for customer
router.get("/bidItems/:id", async(req,res) => {
    const items = await Auction.find({customerId : req.params.id})
    var category = []
    var Polythin = []
    var Aluminium = []
    for(var i=0; i<items.length; i++){
        var itemDetails = await Item.findOne({_id:items[i].itemId})      
        category.push(itemDetails.category)
        if(itemDetails.category == 'Polythin'){
            Polythin.push(itemDetails)
          
        }else if(itemDetails.category == 'Aluminium'){
            Aluminium.push(itemDetails)
         
        }else{
            res.json("Invalid category")
        }
    }

   
    res.status(200).json({"category":category,"Polythin":Polythin,"Aluminium":Aluminium})
    // console.log(Polythin)
})

router.get('/itemBids/:id', async(req,res) => {
    const list = await Auction.find({itemId:req.params.id})
    // var bidValue=[];
    // for(var i=0; i<list.length; i++){
    //     bidValue.push(list[i].bidValue)
    // }
    res.json({"list":list})
    console.log("-------------Bid "+list)
})

router.get('/bidValues/:id', async(req,res) => {
    const list = await Auction.find({itemId:req.params.id})
    var bidValues=[];
    for(var i=0; i<list.length; i++){
        bidValues.push(list[i].bidValue)
    }
    res.json({"bids":bidValues})
    console.log("-------------Bid "+bidValues)
})



module.exports = router;