tableextension 50180 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50180; "Convert to Order"; Boolean)
        {
            Caption = 'Convert to Order';
            DataClassification = ToBeClassified;
        }
        field(50181; "Order Converted"; Boolean)
        {
            Caption = 'Order Converted';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    trigger OnAfterModify()
    var
        myInt: Integer;
    begin
        if "Document Type" = "Document Type"::Quote then
            if ("Order Converted" = true) then begin
                Error('Can not be modified');
            end;
    end;
}
