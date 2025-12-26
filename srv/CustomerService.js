const cds = require('@sap/cds');
 
module.exports = cds.service.impl(async function () {
    const { customer, order } = this.entities;
    this.before("CREATE", order.drafts, (req) => {
        debugger
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.OrderID = `O${random}`
    })
    this.before("CREATE", customer.drafts, (req) => {
        debugger
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.CustomerID = `C${random}`
    })
 
})
 