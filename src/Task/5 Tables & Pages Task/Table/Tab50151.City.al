table 50151 City
{
    Caption = 'City';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "City ID"; Integer)
        {
            Caption = 'City ID';
            // AutoIncrement = true;
            // Editable = false;
        }
        field(2; Name; Text[25])
        {
            Caption = 'Name';
        }
    }
    keys
    {
        key(PK; "City ID")
        {
            Clustered = true;
        }
    }
}
