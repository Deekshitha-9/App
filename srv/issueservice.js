const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {

  const { comment } = this.entities; // ✅ entity name (capitalized usually)
  this.on('approverComment', async function (req) {
    debugger;
    const { ApproverText, IssueID } = req.data;
    // ✅ UPDATE instead of INSERT
    const result = await UPDATE(comment)
      .set({ ApproverText })
      .where({ IssueID });
  });

});

