pageextension 50162 "Line Ref. On Item L Entry" extends "Item Ledger Entries"
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
