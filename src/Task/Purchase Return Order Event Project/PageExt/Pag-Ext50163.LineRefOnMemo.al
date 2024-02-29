pageextension 50163 "Line Ref. On Memo" extends "Posted Purch. Cr. Memo Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Line Reference";Rec."Line Reference")
            {
                ApplicationArea = All;
            }
        }
    }
}
