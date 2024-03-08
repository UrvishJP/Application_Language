codeunit 50170 "Error Factbox"
{
    procedure ValidateFields(Rec: Record "Stagging Customers/Vendors")  

    begin
        
        ErrorMsg.SetContext(Rec);

        if (Rec.Name = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo(Name), 0);

        if (Rec.Address = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo(Address), 0);

        if (Rec."Address 2" = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Address 2"), 0);

        if (Rec.R_Address = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo(R_Address), 0);

        if (Rec."R_Address 2" = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("R_Address 2"), 0);

        if (Rec."No." = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("No."), 0);

        if (NOT MailMng.CheckValidEmailAddress(Rec."E-mail")) then
            ErrorMsg.LogMessage(Rec, Rec.FieldNo("E-mail"), 0, 'Email must contain ''@''.');

    end;


    var
        MailMng: Codeunit "Mail Management";
        ErrorMsg: Record "Error Message";
        Msg: Boolean;
}
