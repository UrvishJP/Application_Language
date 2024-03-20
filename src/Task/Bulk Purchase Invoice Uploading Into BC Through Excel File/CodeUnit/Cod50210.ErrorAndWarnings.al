codeunit 50215 "Error and Warning CodeUnit"
{
    TableNo = "Purchase Order Import Table";
    trigger OnRun()

    begin
        ValidateFields(Rec);
    end;

    procedure ValidateFields(Rec: Record "Purchase Order Import Table"): Boolean

    begin

        ErrorMsg.SetContext(Rec);

        if (Rec."Imported Vendor No." = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Vendor No."), 0);

        if (Rec."Imported Item No." = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Item No."), 0);

        if (Rec."Imported Location Code" = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Location Code"), 0);

        if (Rec."Imported Ship-to Country Code" = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Ship-to Country Code"), 0);

        if (Rec."Imported Item Quantity" = 0) then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Item Quantity"), 0);

        if (Rec."Imported Item Unit Price" = 0) then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Imported Item Unit Price"), 0);

        if (Rec."Vendor No." = '') then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Vendor No."), 0);

        if (Rec."Posting Date" = 0D) then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Posting Date"), 0);

        if (Rec."Order Date" = 0D) then
            ErrorMsg.LogIfEmpty(Rec, Rec.FieldNo("Order Date"), 0);

        if ErrorMsg.HasErrors(false) then
            exit(true);

    end;

    procedure ChangeStyle(Rec: Record "Purchase Order Import Table"): Boolean

    begin
        ErrorMsg.SetContext(Rec);
        exit(ErrorMsg.HasErrors(false));
    end;


    var
        ErrorMsg: Record "Error Message";

}
