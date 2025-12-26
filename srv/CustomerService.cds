using db from '../db/schema';

service CustomerService {
  
  @odata.draft.enabled
  entity customer as projection on db.Customer;
  entity order as projection on db.Order;

}