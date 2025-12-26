namespace db;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity car{
    key carid:String(10);
    carmodel:String;
    carcolor:String;
    carprice:String;
    cartoNfaDetails: Composition of many NfaDetails on cartoNfaDetails.NfaDetailsTocar = $self;
}

entity NfaAttachments : cuid, managed {
       key NfaNumber                  : String;
        carid                         :  String(10);
 
        @Core.MediaType  : MediaType
        Content                    : LargeBinary;
 
        @Core.IsMediaType: true
        MediaType                  : String;
        FileName                   : String;
        Size                       : Integer;
        Url                        : String;
 
        NfaAttachmentsToNfaDetails : Association to one NfaDetails
                                         on NfaAttachmentsToNfaDetails.NfaNumber = NfaNumber;
}








