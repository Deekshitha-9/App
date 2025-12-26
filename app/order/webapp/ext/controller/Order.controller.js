sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    "use strict";

    return {
        Reject: function () {
            sap.ui.getCore().byId(
                "approver::IssueObjectPage--fe::CustomSubSection::ApproverComments--commentInput"
            ).setValue("");

            MessageToast.show("Rejected");
        }
    };
});
