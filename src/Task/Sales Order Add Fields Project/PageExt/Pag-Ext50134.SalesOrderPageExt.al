pageextension 50134 "Sales Order Page Ext" extends "Sales Order"
{
    layout
    {
        addbefore(Status)
        {
            field(Location; Rec.Location)
            {
                ApplicationArea = All;
            }
            
        }
    }
    
}