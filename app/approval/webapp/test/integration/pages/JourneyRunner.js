sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"approval/test/integration/pages/IssueList",
	"approval/test/integration/pages/IssueObjectPage"
], function (JourneyRunner, IssueList, IssueObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('approval') + '/test/flp.html#app-preview',
        pages: {
			onTheIssueList: IssueList,
			onTheIssueObjectPage: IssueObjectPage
        },
        async: true
    });

    return runner;
});

