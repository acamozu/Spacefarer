using SpacefarerService as service from '../../srv/service';
using from '../../db/schema';

annotate service.ReadSpacefarer with @(UI.LineItem: [
    {
        $Type            : 'UI.DataField',
        Label            : '{i18n>FirstName}',
        Value            : first_name,
        ![@UI.Importance]: #High,
    },
    {
        $Type            : 'UI.DataField',
        Label            : '{i18n>LastName}',
        Value            : last_name,
        ![@UI.Importance]: #High,
    },
    {
        $Type      : 'UI.DataField',
        Label      : '{i18n>StardustStatus}',
        Value      : stardust_collection_status_code,
        Criticality: stardust_collection_status.criticality
    },
    {
        $Type: 'UI.DataField',
        Label: '{i18n>SpacesuitColor}',
        Value: spacesuit_color,
    },
]);


annotate service.ReadSpacefarer with @(UI.HeaderInfo: {
    Title         : {
        $Type: 'UI.DataField',
        Value: first_name,
    },
    TypeName      : 'Spacefarer',
    TypeNamePlural: 'Spacefarers',
    Description   : {
        $Type: 'UI.DataField',
        Value: ID,
    },
    TypeImageUrl  : 'sap-icon://customer',
});

annotate service.ReadSpacefarer with @(UI.Facets: [
    {
        $Type : 'UI.CollectionFacet',
        Label : 'General Information',
        ID    : 'deneme',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Personal Information',
                ID    : 'PersonalInformation',
                Target: '@UI.FieldGroup#PersonalInformation',
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Farer Information',
                ID    : 'FarerInformation',
                Target: '@UI.FieldGroup#FarerInformation',
            },
        ],
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : '{i18n>Adventure}',
        ID    : 'i18nAdventure',
        Target: 'adventure/@UI.LineItem#i18nAdventure',
    },

]);


annotate service.ReadSpacefarer with @Common.SemanticKey: [
    first_name,
    last_name
];

annotate service.ReadSpacefarer with @(UI.SelectionFields: [
    stardust_collection_status_code,
    wormhole_navigation_skill_code
]);

annotate service.ReadSpacefarer with {
    stardust_collection_status @Common.ValueListWithFixedValues: true;
    stardust_collection_status @Common.Text                    : stardust_collection_status.descr;
    stardust_collection_status @Common.ValueList               : {
        CollectionPath: 'Status',
        Label         : '',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: stardust_collection_status_code,
                ValueListProperty: 'code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'descr'
            },
        ]
    };
};

annotate service.ReadSpacefarer with {
    wormhole_navigation_skill @Common.ValueList: {
        CollectionPath: 'Skill',
        Label         : '',
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',
                LocalDataProperty: wormhole_navigation_skill_code,
                ValueListProperty: 'code'
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty: 'descr'
            },
        ]
    };
};


annotate service.ReadSpacefarer with {
    email                      @Common.Label: 'Email';
    stardust_collection_status @Common.Label: '{i18n>StardustCollectionStatus}';
    wormhole_navigation_skill  @Common.Label: '{i18n>WormholeNavigationSkill}';

};

annotate service.ReadSpacefarer.adventure with @(UI.LineItem #i18nAdventure: [
    {
        $Type            : 'UI.DataField',
        Value            : message,
        Label            : '{i18n>Message}',
        ![@UI.Importance]: #High,
    },
    {
        $Type: 'UI.DataField',
        Value: timestamp,
    },
]);

annotate service.ReadSpacefarer with @(UI.FieldGroup #PersonalInformation: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>LastName}',
            Value: last_name,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>FirstName}',
            Value: first_name,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>Email}',
            Value: email,
        },
    ],
});

annotate service.ReadSpacefarer with @(UI.FieldGroup #FarerInformation: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Label: '{i18n>SpacesuitColor}',
            Value: spacesuit_color,
        },
        {
            $Type: 'UI.DataField',
            Label: '{i18n>OriginPlanet}',
            Value: origin_planet,
        },
        {
            $Type                    : 'UI.DataField',
            Label                    : '{i18n>Whnsc}',
            Value                    : wormhole_navigation_skill_code,
            CriticalityRepresentation: #WithIcon,
            Criticality              : wormhole_navigation_skill.criticality,
        },
        {
            $Type                    : 'UI.DataField',
            Label                    : '{i18n>Sdcsc}',
            Value                    : stardust_collection_status_code,
            Criticality              : stardust_collection_status.criticality,
            CriticalityRepresentation: #WithIcon,
        },
    ],
});

annotate service.Status with {
    code @Common.Text: {
        $value                : descr,
        ![@UI.TextArrangement]: #TextLast,
    }
};

annotate service.ReadSpacefarer with {
    wormhole_navigation_skill @Common.Text: wormhole_navigation_skill.descr
};


annotate service.ReadSpacefarer with @(Capabilities.NavigationRestrictions: {RestrictedProperties: [{
    NavigationProperty: adventure,
    DeleteRestrictions: {Deletable: stardust_collection_status.insertDeleteRestriction}
}]});


annotate SpacefarerService.ReadSpacefarer {

    first_name @Common.FieldControl: stardust_collection_status.fieldControl;

};

annotate service.ReadSpacefarer with @(
    UI.DataPoint #stardust_collection_status_code: {
        $Type               : 'UI.DataPointType',
        Value               : stardust_collection_status_code,
        Title               : '{i18n>StardustCollectionStatusCode}',
        Criticality         : stardust_collection_status.criticality,
        ![@Common.QuickInfo]: stardust_collection_status_code,
    },
    UI.DataPoint #wormhole_navigation_skill_code : {
        $Type               : 'UI.DataPointType',
        Value               : wormhole_navigation_skill_code,
        Title               : 'Wormhole Navigation Skill Code',
        Criticality         : wormhole_navigation_skill.criticality,
        ![@Common.QuickInfo]: wormhole_navigation_skill_code,
    },
    UI.HeaderFacets                              : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'stardust_collection_status_code',
            Target: '@UI.DataPoint#stardust_collection_status_code',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'wormhole_navigation_skill_code',
            Target: '@UI.DataPoint#wormhole_navigation_skill_code',
        },
    ]
);

annotate service.ReadSpacefarer with {
    spacesuit_color @Common.FieldControl: stardust_collection_status.criticality

};
