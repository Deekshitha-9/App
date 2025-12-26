using MyService as service from '../../srv/service';
annotate service.order with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CustomerID,
                Label : '{i18n>Customer ID}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderAmount,
                Label : '{i18n>Order Amount}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderDate,
                Label : '{i18n>Order Date}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderID,
                Label : '{i18n>Order ID}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderProduct,
                Label : '{i18n>Order Product}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderStatus,
                Label : '{i18n>Order Status}',
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
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Issue',
            ID : 'Issue',
            Target : 'OrdertoIssue/@UI.LineItem#Issue1',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : CustomerID,
            Label : '{i18n>Customer ID}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderAmount,
            Label : '{i18n>Order Amount}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : '{i18n>Order ID}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderDate,
            Label : '{i18n>Order Date}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderProduct,
            Label : '{i18n>Order Product}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderStatus,
            Label : '{i18n>Order Status}',
        },
    ],
);

annotate service.Issue with @(
    UI.LineItem #Issue : [
        
    ],
    UI.LineItem #Order : [
        {
            $Type : 'UI.DataField',
            Value : IssuetoOrder.OrdertoCustomer.CustomertoOrder.OrderAmount,
            Label : 'OrderAmount',
        },
        {
            $Type : 'UI.DataField',
            Value : IssuetoOrder.OrdertoCustomer.CustomertoOrder.CustomerID,
            Label : 'CustomerID',
        },
        {
            $Type : 'UI.DataField',
            Value : IssuetoOrder.OrdertoCustomer.CustomertoOrder.OrderDate,
            Label : 'OrderDate',
        },
        {
            $Type : 'UI.DataField',
            Value : IssuetoOrder.OrdertoCustomer.CustomertoOrder.OrderID,
            Label : 'OrderID',
        },
        {
            $Type : 'UI.DataField',
            Value : IssuetoOrder.OrdertoCustomer.CustomertoOrder.OrderProduct,
            Label : 'OrderProduct',
        },
        {
            $Type : 'UI.DataField',
            Value : IssuetoOrder.OrdertoCustomer.CustomertoOrder.OrderStatus,
            Label : 'OrderStatus',
        },
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            ID : 'GeneralInformation',
            Target : '@UI.FieldGroup#GeneralInformation',
        },
    ],
    UI.FieldGroup #GeneralInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : IssueID,
                Label : '{i18n>Issue ID}',
            },
            {
                $Type : 'UI.DataField',
                Value : IssueTypes_code,
                Label : '{i18n>Issue Types}',
            },
            {
                $Type : 'UI.DataField',
                Value : OrderID,
                Label : '{i18n>Order ID}',
            },
            {
                $Type : 'UI.DataField',
                Value : SolutionTypes_code,
                Label : '{i18n>Solution Types}',
            },
            {
                $Type : 'UI.DataField',
                Value : IssueStatus_code,
                Label : '{i18n>Issue Status}',
            },
        ],
    },
    UI.LineItem #Issue1 : [
        {
            $Type : 'UI.DataField',
            Value : IssueID,
            Label : '{i18n>Issue ID}',
        },
        {
            $Type : 'UI.DataField',
            Value : IssueTypes_code,
            Label : '{i18n>Issue Types}',
        },
        {
            $Type : 'UI.DataField',
            Value : OrderID,
            Label : '{i18n>Order ID}',
        },
        {
            $Type : 'UI.DataField',
            Value : SolutionTypes_code,
            Label : '{i18n>Solution Types}',
        },
        {
            $Type : 'UI.DataField',
            Value : IssueStatus_code,
            Label : '{i18n>Issue Status}',
        },
    ],
);

annotate service.order with {
    OrderID @Common.FieldControl : #ReadOnly
};

annotate service.order with {
    CustomerID @Common.FieldControl : #ReadOnly
};

annotate service.order with {
    OrderProduct @Common.FieldControl : #ReadOnly
};

annotate service.order with {
    OrderAmount @Common.FieldControl : #ReadOnly
};

annotate service.order with {
    OrderDate @Common.FieldControl : #ReadOnly
};

annotate service.order with {
    OrderStatus @Common.FieldControl : #ReadOnly
};

annotate service.Issue with {
    IssueID @Common.FieldControl : #ReadOnly
};

annotate service.Issue with {
    OrderID @Common.FieldControl : #ReadOnly
};

annotate service.Issue with {
    IssueTypes @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IssueTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : IssueTypes_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'Issue Types',
        },
        Common.ValueListWithFixedValues : true,
)};

annotate service.Issue with {
    SolutionTypes @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'SolutionTypes',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : SolutionTypes_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'SolutionTypes',
        },
        Common.ValueListWithFixedValues : true,
)};

            

annotate service.Issue with {
    IssueStatus @(
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'IssueStatus',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : IssueStatus_code,
                    ValueListProperty : 'code',
                },
            ],
            Label : 'IssueStatus',
        },
        Common.ValueListWithFixedValues : true,
)};

