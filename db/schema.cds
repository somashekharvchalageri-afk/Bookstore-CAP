using {
    cuid,
    managed,
    sap.common.Currencies,
} from '@sap/cds/common';

namespace tutorial.db;

entity Books : cuid, managed {
    title       : String;
    author      : Association to Authors;
    genre       : Association to Genres;
    publishedAt : Date;
    pages       : Integer;
    price       : Decimal(9, 2);
    currency    : Association to Currencies;
    stock       : Integer;
    status      : Association to BookStatus;
    Chapters    : Composition of many Chapters
                      on Chapters.book = $self;
}

entity Genres {
    key code        : Genre;
        description : String;
}

type Genre : String enum {
    Fiction = 'Fiction';
    Religion = 'Religion';
    Science = 'Science';
    Cooking = 'Cooking';
}

entity BookStatus {
    key code         : String(1) enum {
            Available = 'A';
            Low_Stock = 'L';
            Unavailable = 'U';
        };
        criticality  : Integer;
        disaplayText : String;
}

entity Authors : cuid, managed {
    name  : String;
    books : Association to many Books
                on books.author = $self;
}

entity Chapters : cuid, managed {
        number : Integer;
    key book   : Association to Books;
        title  : String;
        pages  : Integer;
}
