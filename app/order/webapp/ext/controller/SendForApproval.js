sap.ui.define([
    "sap/m/MessageToast",
    "sap/m/MessageBox"
], function (MessageToast, MessageBox) {
    "use strict";
 
    return {
 
        SendForApproval: function () {
            debugger
            // let oCommentInput = sap.ui.core.Element.getElementById(
            //     "order::orderObjectPage--fe::FooterBar::CustomAction::SendForApproval"
            // );

            MessageBox.confirm("Would you like to proceed with the approval request", {
                actions: [MessageBox.Action.YES, MessageBox.Action.NO],
                onClose: async function (sAction) {
                    if (sAction === MessageBox.Action.YES) {
                        
                        // ===== ADD START =====
                        debugger
                        const oModel = sap.ui.core.Element.getElementById("order::orderObjectPage").getModel()
                        const oCtx = oModel.bindContext("/SendForApproval(...)");

                        oCtx.setParameter("orderlevel", 2);
                        oCtx.setParameter("status", "completed");
                        oCtx.setParameter("currentlevel", 1);
                        

                        await oCtx.execute();

                        MessageToast.show("Sent Successfully");
                    }
                }
            });
        }
    };
});
