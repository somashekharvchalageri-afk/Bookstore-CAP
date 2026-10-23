using BookstoreService as service from '../../srv/service';
annotate service.Books with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Title}',
                Value : title,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Gerne}',
                Value : gerne,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Publishedat}',
                Value : publishedAt,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Pages}',
                Value : pages,
            },
            {
                $Type : 'UI.DataField',
                Label : '{i18n>Price}',
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

