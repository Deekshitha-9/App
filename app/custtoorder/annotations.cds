using CustomerService as service from '../../srv/service';
using from '../../srv/CustomerService';

annotate service.customer with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : CustomerEmail,
                Label : '{i18n>Customer Mail}',
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerName,
                Label : '{i18n>Customer Name}',
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerID,
                Label : '{i18n>Customer ID}',
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerAddress,
                Label : '{i18n>Customer Address}',
            },
            {
                $Type : 'UI.DataField',
                Value : CustomerPhoneNo,
                Label : '{i18n>Customer PhoneNo}',
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
            Label : 'Order',
            ID : 'Order',
            Target : 'CustomertoOrder/@UI.LineItem#Order',
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
            Value : CustomerName,
            Label : '{i18n>Customer Name}',
        },
        {
            $Type : 'UI.DataField',
            Value : CustomerAddress,
            Label : '{i18n>Customer Address}',
        },
        {
            $Type : 'UI.DataField',
            Value : CustomerEmail,
            Label : '{i18n>Customer Email}',
        },
        {
            $Type : 'UI.DataField',
            Value : CustomerPhone,
            Label : '{i18n>Customer PhoneNo}',
        },
    ],
);

annotate service.order with @(
    UI.LineItem #Order : [
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
);

