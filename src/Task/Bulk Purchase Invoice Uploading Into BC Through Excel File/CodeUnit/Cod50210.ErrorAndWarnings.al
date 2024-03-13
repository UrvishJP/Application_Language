codeunit 50210 "Error and Warning CodeUnit"
{
    procedure ValidateFields(Rec: Record "Purchase Order Import Table"): Boolean

    begin

        ErrorMsg.SetContext(Rec);

        if (Rec."Imported Vendor No." = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Vendor No."), 0);

        if ErrorMsg.HasErrors(false) then
            exit(true);

    end;


    var
        ErrorMsg: Record "Error Message";

}
