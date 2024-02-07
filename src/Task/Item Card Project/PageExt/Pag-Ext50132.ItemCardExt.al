pageextension 50132 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addafter(Type)
        {
            field("Bin Reference"; Rec."Bin Reference")
            {
                ApplicationArea = All;
            }
        }
    }
}
