table 50152 School
{
    Caption = 'School';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "School ID"; Integer)
        {
            Caption = 'School ID';
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
        key(PK; "School ID")
        {
            Clustered = true;
        }
    }
}
