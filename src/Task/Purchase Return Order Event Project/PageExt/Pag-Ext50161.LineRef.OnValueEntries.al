pageextension 50161 "Line Ref. On Value Entries" extends "Value Entries"
{
    layout
    {
        addafter("Entry Type")
        {
            field("Line Reference"; Rec."Line Reference")
            {
                ApplicationArea = All;
            }
        }
    }
}
