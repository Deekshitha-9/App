using issueservice as service from '../../srv/issueservice';
annotate service.Issue with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'IssueID',
                Value : IssueID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'OrderID',
                Value : OrderID,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Issue Types}',
                Value : IssueTypes_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Solution Types}',
                Value : SolutionTypes_code,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Issue Status}',
                Value : IssueStatus_code,
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
            Label : 'Comment',
            ID : 'Comment',
            Target : 'IssuetoComment/@UI.LineItem#Comment',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Attachment',
            ID : 'Attachment',
            Target : 'IssuetoAttachment/@UI.LineItem#Attachment',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'OrderID',
            Value : OrderID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'IssueID',
            Value : IssueID,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Issue Types}',
            Value : IssueTypes_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Solution Types}',
            Value : SolutionTypes_code,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Issue Status}',
            Value : IssueStatus_code,
        },
    ],
);

annotate service.Issue with {
    IssueTypes @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'IssueTypes',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : IssueTypes_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Issue with {
    SolutionTypes @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'SolutionTypes',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : SolutionTypes_code,
                ValueListProperty : 'code',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

annotate service.Issue with {
    IssueStatus @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'IssueStatus',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : IssueStatus_code,
                ValueListProperty : 'code',
            },
        ],
    }
};

annotate service.comment with @(
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
                Value : CommenttoIssuse.IssueID,
                Label : 'IssueID',
            },
            {
                $Type : 'UI.DataField',
                Value : CommenttoIssuse.IssueStatus_code,
                Label : '{i18n>Issue Status}',
            },
            {
                $Type : 'UI.DataField',
                Value : CommenttoIssuse.IssueTypes_code,
                Label : '{i18n>Issue Types}',
            },
            {
                $Type : 'UI.DataField',
                Value : CommenttoIssuse.OrderID,
                Label : 'OrderID',
            },
            {
                $Type : 'UI.DataField',
                Value : CommenttoIssuse.SolutionTypes_code,
                Label : '{i18n>Solution Types}',
            },
        ],
    },
    UI.LineItem #Comment : [
        {
            $Type : 'UI.DataField',
            Value : CommentText,
            Label : '{i18n>Comment Text}',
        },
    ],
);

annotate service.attachment with @(
    UI.LineItem #Attachment : [
        {
            $Type : 'UI.DataField',
            Value : AttachmenttoIssuse.IssuetoAttachment.Content,
            Label : 'Content',
        },
        {
            $Type : 'UI.DataField',
            Value : AttachmenttoIssuse.IssuetoAttachment.createdAt,
        },
        {
            $Type : 'UI.DataField',
            Value : AttachmenttoIssuse.IssuetoAttachment.FileName,
            Label : 'FileName',
        },
        {
            $Type : 'UI.DataField',
            Value : AttachmenttoIssuse.IssuetoAttachment.MediaType,
            Label : 'MediaType',
        },
        {
            $Type : 'UI.DataField',
            Value : AttachmenttoIssuse.IssuetoAttachment.Size,
            Label : 'Size',
        },
    ]
);

