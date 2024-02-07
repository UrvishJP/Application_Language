pageextension 50131 "Contact Card  Ext" extends "Contact Card"
{
    layout
    {
        addbefore(Name)
        {
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = All;
            }
            field("Last Name";Rec.Surname)
            {
                ApplicationArea = All;
                Caption = 'Last Name';
            }
        }
        modify(Name)
        {
            Editable = false;
        }
    }
}
