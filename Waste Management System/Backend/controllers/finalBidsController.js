const {Router} = require('express');
const router = Router();

const FinalBids = require('../model/finalBidModel')
const Item = require('../model/itemModel')

router.get("/ownItems/:id", async(req,res) => {
    const items = await FinalBids.find( {buyerId : req.params.id} )
    res.status(200).json({"items":items})
    console.log(items)
})

router.get("/vendorItems/:id", async(req,res) => {
    const items = await FinalBids.find( {customerId : req.params.id} )
    res.status(200).json({"items":items})
    console.log(items)
})


module.exports = router;