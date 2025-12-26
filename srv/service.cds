using db from '../db/schema';

service MyService {
  @odata.draft.enabled
  entity order as projection on db.Order where OrderStatus = 'Delivered';
  entity Issue as projection on db.Issue;
  entity IssueTypes as projection on db.IssueTypes;
  entity SolutionTypes as projection on db.SolutionTypes;
  entity IssueStatus as projection on db.IssueStatus ;
  entity comment as projection on db.Comment;
  entity attachment as projection on db.Attachment;

  function addComment(CommentId:String,IssueID:String,CommentText:String)returns String;
  function CommentDraft(IssueID:String,CommentText:String)returns String;

  function SendForApproval(
  orderlevel   : Integer,
  status       : String,
  currentlevel : Integer
) returns String;
}

annotate MyService.order with
  @Capabilities.InsertRestrictions: {
    Insertable: false
  };





