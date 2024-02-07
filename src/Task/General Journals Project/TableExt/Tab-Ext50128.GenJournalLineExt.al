tableextension 50128 "Gen. Journal Line Ext" extends "Gen. Journal Line"
{
    fields
    {
        field(50100; "Transaction_Type"; Enum "Transaction_Type")
        {
            Caption = 'Transaction Type';
            DataClassification = ToBeClassified;

           
        }
        modify("Document Type")
        {
            trigger OnAfterValidate()

            begin
                if Rec."Document Type" <> Rec."Document Type"::Payment then
                    Rec."Transaction_Type" := "Transaction_Type"::" ";
            end;
        }
    }
}
