using db from '../db/schema';

service MyService {
<<<<<<< HEAD
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





=======

    entity Car as projection on db.car;
    entity NfaDetails as projection on db.NfaDetails;
    entity NfaEventHistory as projection on db.NfaEventHistory;
    entity NfaVendorData as projection on db.NfaVendorData;
    entity NfaVendorItemsDetails as projection on db.NfaVendorItemsDetails;
    entity NfaVendorDueDeligenceDetails as projection on db.NfaVendorDueDeligenceDetails;
    entity NfaVendorDueDeligenceDetailsGrade  as projection on db.NfaVendorDueDeligenceDetailsGrade;
    entity NfaAttachments as projection on db.NfaAttachments;
    entity NfaCommentsHistory as projection on db.NfaCommentsHistory;
    entity NfaWorkflowHistory as projection on db.NfaWorkflowHistory;
    entity Rules as projection on db.Rules;
    entity RulesCondition as projection on db.RulesCondition;
    entity RulesLevels as projection on db.RulesLevels;
    entity RulesApprovers as projection on db.RulesApprovers;
    entity Approvers as projection on db.Approvers;

}
>>>>>>> ef6639b (Fragment and Attachment)
