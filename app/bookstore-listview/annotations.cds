using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>PublishedAt1}',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Pages1}',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price1}',
                Value : price,
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
            Label : 'Entry Information',
            ID : 'EntryInformation',
            Target : '@UI.FieldGroup#EntryInformation',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Chapters}',
            ID : 'i18nChapters',
            Target : 'Chapters/@UI.LineItem#i18nChapters',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : '{i18n>BookName}',
            Value : title,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Gerne1}',
            Value : gerne,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>PublishedAt}',
            Value : publishedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Pages1}',
            Value : pages,
        },
        {
            $Type : 'UI.DataField',
            Label : '{i18n>Price1}',
            Value : price,
        },
    ],
    UI.SelectionFields : [
        price,
        publishedAt,
    ],
    UI.HeaderInfo : {
        Title : {
            $Type : 'UI.DataField',
            Value : title,
        },
        TypeName : 'Book',
        TypeNamePlural : 'Books',
        TypeImageUrl : 'sap-icon://course-book',
        Description : {
            $Type : 'UI.DataField',
            Value : gerne,
        },
    },
    UI.FieldGroup #EntryInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : modifiedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : modifiedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
        ],
    },
);

annotate service.Books with {
    author @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Authors',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : author_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
        ],
    }
};

annotate service.Books with {
    price @Common.Label : '{i18n>Price}'
};

annotate service.Books with {
    publishedAt @Common.Label : 'publishedAt'
};

annotate service.Chapters with @(
    UI.LineItem #i18nChapters : [
        {
            $Type : 'UI.DataField',
            Value : title,
            Label : '{i18n>Title1}',
        },
        {
            $Type : 'UI.DataField',
            Value : pages,
            Label : '{i18n>Pages1}',
        },
        {
            $Type : 'UI.DataField',
            Value : number,
            Label : '{i18n>Number}',
        },
    ]
);

