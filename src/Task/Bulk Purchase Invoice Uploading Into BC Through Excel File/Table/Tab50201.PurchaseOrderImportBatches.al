table 50201 "Purchase Order Import Batches"
{
    Caption = 'Purchase Order Import Batches';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Name; Text[25])
        {
            Caption = 'Name';
        }
        field(2; Description; Text[25])
        {
            Caption = 'Description';
        }
        field(3; "Reading CodeUnit"; Integer)
        {
            Caption = 'Reading CodeUnit';
        }
        field(4; "Validation CodeUnit"; Integer)
        {
            Caption = 'Validation CdeUnit';
        }
        field(5; "Processing CodeUnit"; Integer)
        {
            Caption = 'Processing CodeUnit';
        }
    }
    keys
    {
        key(PK; Name)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()

    var
        ImpPurchaseTable: Record "Purchase Order Import Table";

    begin
        ImpPurchaseTable.SetRange("Batch Name", Name);
        ImpPurchaseTable.DeleteAll();
    end;
}
