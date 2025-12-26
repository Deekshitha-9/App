const cds = require('@sap/cds');
const { INSERT } = require('@sap/cds/lib/ql/cds-ql');
 
module.exports = cds.service.impl(async function () {
    const {Issue,comment} = this.entities;
    
    this.before("CREATE", Issue.drafts, (req) => {
        debugger
        const random = Math.floor(1000 + Math.random() * 9000);
        req.data.IssueID = `I${random}`
    })
 
     const{ Comment } = this.entities;

    this.on('CommentDraft', async function (req) {
        debugger;
        console.log("req", req)
        const { uuid } = cds.utils;
        const draftId = uuid();
        const result2 = await INSERT.into('DRAFT.DraftAdministrativeData').entries({
            DraftUUID: draftId,
            CreationDateTime: new Date().toISOString(),
            CreatedByUser: req.user.id,
            LastChangeDateTime: new Date().toISOString(),
            LastChangedByUser: req.user.id,
            InProcessByUser: req.user.id,
            DraftIsCreatedByMe: true,
            DraftIsProcessedByMe: true
        });
 
        const result = await INSERT.into(comment.drafts).entries({
            CommentText: req.data.CommentText,
            IssueID: req.data.IssueID,
            DraftAdministrativeData_DraftUUID: draftId,
 
        });
        console.log(result);
        const draftResult = result.results.changes;
 
        console.log(result2);
        const draftAdminResult = result2.results.changes;
 
        return {
            "CommentDraft": draftResult,
            "draftAdmin": draftAdminResult
        }
 
    });

    this.on('addComment', async function (req) {
        debugger;
        console.log("req", req)
        const comment = {
        CommentId: req.data.CommentId,
        CommentText : req.data.CommentText,
        IssueID:req.data.IssueID,
    };
        const result = await INSERT.into(comment).entries(comment);
        console.log(result);
        const inserted = result.results.changes;
        console.log(typeof inserted)
 
        return JSON.stringify(inserted);
 
    });


    


     const axios = require('axios');
     this.on('SendForApproval', async function () {
        debugger
        try {
            console.log("process trigger");
            var client = 'sb-f7dd4ca8-56ef-4144-ac41-0a8228c55f72!b556487|xsuaa!b49390';
            var secret = '3f252850-5bf4-4b0f-8ed9-2dd4129b2cfd$Vf1XeK7KHTNT3T0uwGq9Ivd8JzYyqu5_ZL1tO8LZESw=';
            var auth1 = Buffer.from(client + ':' + secret, 'utf-8').toString('base64');
            var response1 = await axios.request('https://096b6e52trial.authentication.us10.hana.ondemand.com/oauth/token?grant_type=client_credentials',
                {
                    method: 'POST',
                    headers: {
                        'Authorization': 'Basic ' + auth1
                    }
                });
            console.log(response1);
            var bodyy = JSON.parse(JSON.stringify({
 
                "definitionId": "us10.096b6e52trial.apicopy.aPI",
                "context": {
                    "orderlevel": 2,
                    "status": "Completed",
                    "currentlevel": 1
                  }
            }));
            console.log(bodyy);
            var response11 = await axios.post(`https://spa-api-gateway-bpi-us-prod.cfapps.us10.hana.ondemand.com/workflow/rest/v1/workflow-instances`, bodyy,
                {
                    headers: {
                        'Authorization': 'Bearer ' + response1.data.access_token,
                    }
                });
 
 
        } catch (error) {
            console.log(error)
        }
 
    })

});
