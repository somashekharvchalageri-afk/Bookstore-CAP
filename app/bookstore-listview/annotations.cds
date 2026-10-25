using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    odata.draft.enabled,
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.addStock',
            Label : 'Add stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.changePublishDate',
            Label : 'Change publish date',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.changeStatus',
            Label : 'Change status',
        },
    ],
);

annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : Chapters.title,
                Label : 'Title',
            },
            {
                $Type : 'UI.DataField',
                Value : genre_code,
                Label : 'genre',
            },
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
                Label : 'Price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'Status',
                Criticality : status.criticality,
            },
            {
                $Type : 'UI.DataField',
                Value : currency_code,
                Label : 'Currency',
            },
            {
                $Type : 'UI.DataField',
                Value : stock,
                Label : 'Stock',
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
            Label : '{i18n>genre1}',
            Value : genre_code,
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
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
        },
        {
            $Type : 'UI.DataField',
            Value : status_code,
            Label : 'Status',
            Criticality : status.criticality,
            CriticalityRepresentation : #WithIcon,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'BookstoreService.addStock',
            Label : 'Add stock',
        },
    ],
    UI.SelectionFields : [
        status_code,
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
            Value : genre_code,
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
    UI.HeaderFacets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Header',
            ID : 'Header',
            Target : '@UI.FieldGroup#Header',
        },
    ],
    UI.FieldGroup #Header : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : status_code,
                Label : 'Status',
                Criticality : status.criticality,
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

annotate service.Books with {
    status @(
        Common.Text : status.disaplayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
        Common.Label : 'Status_code',
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Status',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : status_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : true,
    )
};

annotate service.Books with {
    stock @Common.Label : 'stock'
};

annotate service.Status with {
    code @(
        Common.Text : disaplayText,
        Common.Text.@UI.TextArrangement : #TextOnly,
)};

annotate service.Books with {
    currency @Common.ValueListWithFixedValues : true
};

annotate service.Books with {
    genre @(
        UI.MultiLineText : false,
        Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'genres',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : genre_code,
                    ValueListProperty : 'code',
                },
            ],
        },
        Common.ValueListWithFixedValues : false,
    )
};

annotate service.genres with {
    code @Common.Text : description
};

