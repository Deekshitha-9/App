sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"app1/test/integration/pages/CarList",
	"app1/test/integration/pages/CarObjectPage"
], function (JourneyRunner, CarList, CarObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('app1') + '/test/flp.html#app-preview',
        pages: {
			onTheCarList: CarList,
			onTheCarObjectPage: CarObjectPage
        },
        async: true
    });

    return runner;
});

