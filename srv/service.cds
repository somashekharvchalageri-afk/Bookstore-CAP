using { tutorial.db as db } from '../db/schema';

service BookstoreService {
    entity Books as Projection on db.Books;
    entity Authors as Projection on db.Authors;
    entity Chapters as Projection on db.Chapters;
}