sap.ui.define([
    "sap/m/MessageToast"
], function (MessageToast) {
    "use strict";

    return {
        Reject: function () {
            sap.ui.getCore().byId(
                "approval::IssueObjectPage--fe::CustomSubSection::AddComment--Input"
            ).setValue("");

            MessageToast.show("Rejected");
        }
    };
});
