sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (MessageToast, MessageBox) {
    "use strict";
 
    return {
        Approve: async function (oContext, aSelectedContexts) {
            debugger
 
            let IssueIdvalue = sap.ui.core.Element.getElementById("approval::IssueObjectPage--fe::FormContainer::GeneratedFacet1::FormElement::DataField::IssueID::Field-display");
 
            let IssueID = IssueIdvalue.getText();
            console.log("IssueID:", IssueID);
 
            let CommentText = sap.ui.core.Element.getElementById("approval::IssueObjectPage--fe::CustomSubSection::AddComment--Input");
 
            let Text = CommentText.getValue();
 
            if (!Text || Text.trim() === "") {
                MessageBox.error("Please enter the comment");
                return;
            }
 
            try {
                let oModel = IssueIdvalue.getModel();
                let oFunc = oModel.bindContext("/approverComment(...)");
 
                oFunc.setParameter("IssueID", IssueID);
                oFunc.setParameter("ApproverText",Text );
 
                await oFunc.execute();
 
                let result = oFunc.getBoundContext().getObject();
                console.log("Action Result:", result);
 
                MessageToast.show("Approved successfully");
 
            } catch (Error) {
                console.error(Error);
                MessageBox.error("Error while approving the issue");
            }
        
        
                    if (CommentText) {
                        console.log(CommentText.getEnabled());
                        if (CommentText.getEnabled() === false && aComments.length > 0) {
                            CommentText.setValue(aComments[0].description)
                        }
                     else if (CommentText.getEnabled() === false && aComments.length == 0) {
                        CommentText.setValue("No previous comments")
                    }
                }
            }
 
    };
});
 