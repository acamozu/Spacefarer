sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'spacefarer/test/integration/FirstJourney',
		'spacefarer/test/integration/pages/ReadSpacefarerList',
		'spacefarer/test/integration/pages/ReadSpacefarerObjectPage',
		'spacefarer/test/integration/pages/ReadSpacefarer_adventureObjectPage'
    ],
    function(JourneyRunner, opaJourney, ReadSpacefarerList, ReadSpacefarerObjectPage, ReadSpacefarer_adventureObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('spacefarer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheReadSpacefarerList: ReadSpacefarerList,
					onTheReadSpacefarerObjectPage: ReadSpacefarerObjectPage,
					onTheReadSpacefarer_adventureObjectPage: ReadSpacefarer_adventureObjectPage
                }
            },
            opaJourney.run
        );
    }
);