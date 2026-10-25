import { Books } from '#cds-models/BookstoreService'
import { Gerne } from '#cds-models/tutorial/db'
import cds from '@sap/cds'

export class BookstoreService extends cds.ApplicationService {
  init() {

    this.on('addStock', Books, async (req) => {
      const bookId = req.params[0].ID;
      await UPDATE(Books).set({ stock: { '+=': 1 } }).where({ ID: bookId })
    })

    this.on('changePublishDate', Books, async (req) => {
      const bookId = req.params[0].ID;
      const newDate = req.data.newDate;
      if (newDate) {
        await UPDATE(Books).set({ publishedAt: newDate }).where({ ID: bookId })
      }
    })

    this.on('changeStatus', Books, async (req) => {
      const bookId = req.params[0].ID;
      const newStatus = req.data.newStatus;
      if (newStatus) {
        await UPDATE(Books).set({ status_code: newStatus }).where({ ID: bookId })
      }
    })

    this.on('addDiscount', async (req) => {
      await UPDATE(Books).set({ price: { func: 'ROUND', args: [{ xpr: [{ ref: ['price'] }, '*', { val: 0.9 }] }, {val: 2}] } })
    })

    this.before(['READ'], Books, async (req) => {
      console.log('Before READ Books')
    })
    this.after('READ', Books, async (books, req) => {
      for (const book of books) {
        if (book.gerne_code === 'Religion') {
          book.price = book.price * 0.8;
        }
      }
    })



    return super.init()
  }
}
