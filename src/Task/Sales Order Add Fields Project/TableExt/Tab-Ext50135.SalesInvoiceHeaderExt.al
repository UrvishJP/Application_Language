tableextension 50135 "Sales Invoice Header Ext" extends "Sales Invoice Header"
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
