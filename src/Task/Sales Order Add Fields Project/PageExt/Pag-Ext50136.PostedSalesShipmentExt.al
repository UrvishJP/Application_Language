pageextension 50136 "Posted Sales Shipment Ext" extends "Posted Sales Shipment"
{
    layout
    {
        addafter("Order No.")
        {
            field(Location; Rec.Location)
            {
                ApplicationArea = All;
            }
        }
    }
}
