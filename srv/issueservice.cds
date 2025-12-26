using db from '../db/schema';

service issueservice {
  entity order as projection on db.Order where OrderStatus = 'Delivered';
  entity Issue as projection on db.Issue;
  entity IssueTypes as projection on db.IssueTypes;
  entity SolutionTypes as projection on db.SolutionTypes;
  entity IssueStatus as projection on db.IssueStatus where IssueStatus.code = 'ON_HOLD';
  entity comment as projection on db.Comment;
  entity attachment as projection on db.Attachment;


  function approverComment (
    IssueID     : String,
    ApproverText : String
  ) returns String;
}

annotate issueservice.Issue with
  @Capabilities.InsertRestrictions: {
    Insertable: false
  };
