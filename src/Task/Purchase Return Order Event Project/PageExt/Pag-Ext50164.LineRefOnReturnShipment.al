pageextension 50164 "Line Ref. On Return Shipment" extends "Posted Return Shipment Subform"
{

    layout
    {
        addafter("No.")
        {
            field("Line Reference"; Rec."Line Reference")
            {
                ApplicationArea = All;
            }
        }
    }
}
