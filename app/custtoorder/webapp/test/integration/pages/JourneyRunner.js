sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"custtoorder/test/integration/pages/customerList",
	"custtoorder/test/integration/pages/customerObjectPage",
	"custtoorder/test/integration/pages/orderObjectPage"
], function (JourneyRunner, customerList, customerObjectPage, orderObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('custtoorder') + '/test/flp.html#app-preview',
        pages: {
			onThecustomerList: customerList,
			onThecustomerObjectPage: customerObjectPage,
			onTheorderObjectPage: orderObjectPage
        },
        async: true
    });

    return runner;
});

