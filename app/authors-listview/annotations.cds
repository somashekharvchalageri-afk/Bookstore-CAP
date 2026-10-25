using BookstoreService as service from '../../srv/service';
annotate service.Authors with @(
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Ebook File',
            ID : 'Ebook',
            Target : '@UI.FieldGroup#Ebook',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Books information',
            ID : 'Booksinformation',
            Target : '@UI.FieldGroup#Booksinformation',
        },
    ],
    UI.FieldGroup #Ebook : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : content,
                Label : 'content',
            },
        ],
    },
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : name,
            Label : 'Name',
        },
    ],
    UI.FieldGroup #Booksinformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : bookCount,
                Label : 'bookCount',
            },
        ],
    },
);

