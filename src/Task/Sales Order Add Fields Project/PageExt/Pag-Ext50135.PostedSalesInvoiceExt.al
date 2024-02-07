pageextension 50135 "Posted Sales Invoice Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter(Cancelled)
        {
            field(Location; Rec.Location)
            {
                ApplicationArea = All;
            }
        }
    }

   
}
