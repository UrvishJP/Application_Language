table 50250 "Control Statements Table"
{
    Caption = 'Control Statements Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            AutoIncrement = true;
        }
        field(2; Integer; Integer)
        {
            Caption = 'Integer';
        }
        field(3; Option; Option)
        {
            Caption = 'Option';
            OptionMembers = empty,Option1,Option2;
            OptionCaption = ' ,Option1,Option2';
        }
        field(4; Name; Text[25])
        {
            Caption = 'Name';
        }
        field(5; Code; Text[25])
        {
            Caption = 'Code';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
