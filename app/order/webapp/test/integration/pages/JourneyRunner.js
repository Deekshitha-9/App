sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"order/test/integration/pages/orderList",
	"order/test/integration/pages/orderObjectPage",
	"order/test/integration/pages/issueObjectPage"
], function (JourneyRunner, orderList, orderObjectPage, issueObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('order') + '/test/flp.html#app-preview',
        pages: {
			onTheorderList: orderList,
			onTheorderObjectPage: orderObjectPage,
			onTheissueObjectPage: issueObjectPage
        },
        async: true
    });

    return runner;
});

