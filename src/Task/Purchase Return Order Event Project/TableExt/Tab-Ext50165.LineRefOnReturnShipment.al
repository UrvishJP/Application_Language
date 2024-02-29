tableextension 50165 "Line Ref. On Return Shipment" extends "Return Shipment Line"
{
    fields
    {
        field(50105; "Line Reference"; Text[50])
        {
            Caption = 'Line Reference';
            DataClassification = ToBeClassified;
        }
    }
}
