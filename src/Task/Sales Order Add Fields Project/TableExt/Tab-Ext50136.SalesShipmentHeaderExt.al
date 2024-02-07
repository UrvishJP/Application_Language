tableextension 50136 "Sales Shipment Header Ext" extends "Sales Shipment Header"
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
