sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'spacefarer',
            componentId: 'ReadSpacefarer_adventureObjectPage',
            contextPath: '/ReadSpacefarer/adventure'
        },
        CustomPageDefinitions
    );
});