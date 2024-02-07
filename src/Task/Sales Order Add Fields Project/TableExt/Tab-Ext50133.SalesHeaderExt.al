tableextension 50133 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50100; Location; Text[20])
        {
            Caption = 'Location';
            DataClassification = ToBeClassified;
        }
    
    }
}
