pageextension 50180 "Sales Quote Ext" extends "Sales Quote Subform"
{
    layout
    {
        addbefore(Type)
        {
            field("Convert to Order"; Rec."Convert to Order")
            {
                
            }
            field("Order Converted";Rec."Order Converted")
            {

            }
        }
    }
}
