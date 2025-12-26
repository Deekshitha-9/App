namespace db;

using {
  cuid,
  managed
} from '@sap/cds/common';

entity Customer {
  key CustomerID    : String @UI.Placeholder:'CustomerId' @readonly;
    CustomerName    : String @mandatory;
    CustomerPhoneNo : String(10) @mandatory @assert.format: '^[0-9]{10}$';
    CustomerEmail   : String @mandatory @assert.format: '[a-z]+[0-9]@gmail\.com$';
    CustomerAddress : String @mandatory;
    CustomertoOrder : Composition of many Order on CustomertoOrder.OrdertoCustomer = $self;
}

entity Order {
  key OrderID       : String(36) @UI.Placeholder:'Order Id' @readonly ;
  key CustomerID    : String @UI.Placeholder:'Customer Id'@readonly ;
    OrderProduct    : String;
    OrderAmount     : Decimal(10, 2);
    OrderDate       : Date;
    OrderStatus     : String;
    OrdertoIssue    : Composition of many Issue on OrdertoIssue.IssuetoOrder = $self;
    OrdertoCustomer : Association to one Customer on OrdertoCustomer.CustomerID = CustomerID;
}

entity Issue {
  key IssueID            : String @UI.Placeholder:'Issue ID' @readonly;
  key OrderID            : String @UI.Placeholder:'Order ID' @readonly;
    IssueTypes           : Association to IssueTypes;
    SolutionTypes        : Association to SolutionTypes;
    IssueStatus          : Association to IssueStatus;
    IssuetoOrder         : Association to one Order on IssuetoOrder.OrderID = OrderID;
    IssuetoComment       : Composition of many Comment on IssuetoComment.CommenttoIssuse = $self;
    IssuetoAttachment    : Composition of many Attachment on IssuetoAttachment.AttachmenttoIssuse = $self;
}

entity Comment: cuid, managed {
    key IssueID     : String ;
    CommentText     : String;
    ApproverText   :String;
    CommenttoIssuse : Association to one Issue on CommenttoIssuse.IssueID = IssueID;
}

entity Attachment : cuid, managed {
    key IssueID        : String ;
    @Core.MediaType: MediaType
    Content            : LargeBinary;
    @Core.IsMediaType: true
    MediaType          : String;
    FileName           : String;
    Size               : Integer;
    Url                : String;
    AttachmenttoIssuse : Association to one Issue on AttachmenttoIssuse.IssueID = IssueID;
}

entity IssueTypes {
  key code    : String(30);
  description : String(100);
}

entity SolutionTypes {
  key code    : String(20);
  description : String(50);
}

entity IssueStatus {
  key code    : String(20);
  description : String(50);
  
}


