table 50220 "Multiple Copies of Report"
{
    Caption = 'Multiple Copies of Report';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; No; Integer)
        {
            Caption = 'No';
        }
        field(2; "Item Name"; Text[25])
        {
            Caption = 'Item Name';
        }
        field(3; Price; Integer)
        {
            Caption = 'Price';
        }
    }
    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}
