table 50153 Stream
{
    Caption = 'Stream';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "Type"; Enum Stream)
        {
            Caption = 'Type';
        }
        field(2; Subject; Text[25])
        {
            Caption = 'Subject';
        }
        field(3; "Total Marks"; Decimal)
        {
            Caption = 'Total Marks';
        }
    }
    keys
    {
        key(PK; "Type",Subject)
        {
            Clustered = true;
        }
    }
}
