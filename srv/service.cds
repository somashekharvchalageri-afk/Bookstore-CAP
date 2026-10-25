using {tutorial.db as db} from '../db/schema';

service BookstoreService {
    entity Books    as projection on db.Books
        actions {
            @(Common.SideEffects: {TargetProperties: ['stock']})
            action addStock();
            action changePublishDate(newDate: Date);
            @(Common.SideEffects: {TargetEntities: ['in']})
            action changeStatus( @(Common: {
                                     Common.ValueListWithFixedValues: true,
                                     Label : 'New Status',
                                     ValueList                      : {
                                         $Type         : 'Common.ValueListType',
                                         CollectionPath: 'Status',
                                         Parameters    : [{
                                             $Type            : 'Common.ValueListParameterInOut',
                                             LocalDataProperty: newStatus,
                                             ValueListProperty: 'code',
                                         }, ],
                                     },
                                 })
                                 newStatus: String);
        };

    @(Common.SideEffects: {TargetEntities: ['/BookstoreService.EntityContainer/Books']})
    action addDiscount();

    entity Authors  as projection on db.Authors;
    entity Chapters as projection on db.Chapters;
    entity Status   as projection on db.BookStatus;
    entity Genres   as projection on db.Genres;
}

annotate BookstoreService.Books with @odata.draft.enabled;
