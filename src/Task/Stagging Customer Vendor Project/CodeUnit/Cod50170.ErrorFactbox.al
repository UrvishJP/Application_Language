codeunit 50170 "Error Factbox"
{
    procedure ValidateFields(Rec: Record "Stagging Customers/Vendors"): Boolean

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

        if ErrorMsg.HasErrors(false) then
            exit(true);

    end;


    var
        ErrorMsg: Record "Error Message";
        MailMng: Codeunit "Mail Management";

}
