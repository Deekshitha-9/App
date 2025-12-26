sap.ui.define(['sap/ui/core/mvc/ControllerExtension',
		'sap/m/MessageBox'],
  function (ControllerExtension,MessageBox) {
	'use strict';

	return ControllerExtension.extend('order.ext.controller.Issue', {	
		override: {
			onInit: function () {
				this._bApplyAttached = false;

				// Wait for the view to render, then attach to the Apply button
				const oView = this.getView();  // or this.base.getView()
				oView.addEventDelegate({
					onAfterRendering: function () {
						debugger;

						if (this._bApplyAttached) {
							return;
						}

						let oApplyButton = sap.ui.core.Element.getElementById("order::order_OrdertoIssueObjectPage--fe::FooterBar::StandardAction::Apply");


						if (oApplyButton) {
							oApplyButton.attachPress(async function () {
								debugger;  // Your breakpoint
								this._bApplyAttached = true;
								console.log("Apply button clicked on Issues sub-page - custom logic triggered!");
								let IssueID = sap.ui.core.Element.getElementById("order::order_OrdertoIssueObjectPage--fe::FormContainer::GeneralInformation::FormElement::DataField::IssueID::Field-display");

								if (IssueID) {
									IssueID = IssueID.getText();
								}
								console.log("--->>>>>" + IssueID);

								let CommentText  = sap.ui.core.Element.getElementById("order::order_OrdertoIssueObjectPage--fe::CustomSubSection::Comments--Input")

								if (CommentText) {
									CommentText  = CommentText.getValue()
									sap.m.MessageBox.warning("enter the comment");
								}

								let oModel = sap.ui.core.Element.getElementById("order::order_OrdertoIssueObjectPage--fe::FormContainer::GeneralInformation::FormElement::DataField::IssueID::Field-display").getModel();
								let oFunc = oModel.bindContext(`/CommentDraft(...)`);
								oFunc.setParameter("IssueID", IssueID)
								oFunc.setParameter("CommentText", CommentText )
								await oFunc.execute();
								const result = oFunc.getBoundContext().getObject();
								//get result
								console.log("----//////>>>." + result)
							}.bind(this));
						} else {
							console.warn("Apply button not found. Check the exact ID in browser dev tools.");
						}
					}
				});
			},

		}
	});
});
