pageextension 50160 "Line Ref. On Value L. Entry" extends "Purchase Return Order Subform"
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
