table 50202 "Purchase Order Import Setup"
{
    Caption = 'Purchase Order Import Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; SID; Integer)
        {
            Caption = 'SID';
            AutoIncrement = true;
        }
        field(2; "Release Order Upon Create"; Boolean)
        {
            Caption = 'Release Order Upon';
        }
        field(3; "Override Sales Person"; Text[50])
        {
            Caption = 'Override Sales Person';
            TableRelation = "Salesperson/Purchaser";
        }
    }
    keys
    {
        key(PK; SID)
        {
            Clustered = true;
        }
    }
}
