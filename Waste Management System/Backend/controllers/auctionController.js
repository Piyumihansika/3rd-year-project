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
            console.log(auction);

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
       console.log(details)
   

    }

    
})

router.post('/addFinalBid', async(res,req) => {

    try{
        const {customerId, itemId, biddingTime, buyerId, bidValue} = details;
        const finalBid = new FinalBid({
           customerId, itemId, biddingTime, buyerId, bidValue
        });
        await finalBid.save();
        console.log(finalBid);
    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem in the bid');
    }

})

module.exports = router;