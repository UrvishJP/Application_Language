codeunit 50170 "Error Factbox"
{

    procedure ValidateFields(Rec: Record "Stagging Customers/Vendors")

    var
        ErrorMsg: Record "Error Message";

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


    end;

    procedure DeleteLines(Rec: Record "Stagging Customers/Vendors")

    var
        ErrorMsg: Record "Error Message";

    begin

        ErrorMsg.ClearLog();
        // ErrorMsg.SetContext(Rec);
    end;



}
