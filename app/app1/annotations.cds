using MyService as service from '../../srv/service';
annotate service.Car with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'carid',
                Value : carid,
            },
            {
                $Type : 'UI.DataField',
                Label : 'carmodel',
                Value : carmodel,
            },
            {
                $Type : 'UI.DataField',
                Label : 'carcolor',
                Value : carcolor,
            },
            {
                $Type : 'UI.DataField',
                Label : 'carprice',
                Value : carprice,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'carid',
            Value : carid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'carmodel',
            Value : carmodel,
        },
        {
            $Type : 'UI.DataField',
            Label : 'carcolor',
            Value : carcolor,
        },
        {
            $Type : 'UI.DataField',
            Label : 'carprice',
            Value : carprice,
        },
    ],
);

