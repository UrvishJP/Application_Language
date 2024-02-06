pageextension 50125 "Purchase Order Ext" extends "Purchase Line FactBox"
{
    layout
    {
        addafter(PurchaseLineDiscounts)
        {
            field("Standard Cost"; S_Cost."Standard Cost")
            {
                ApplicationArea = All;
            }
            field("Unit Cost"; S_Cost."Unit Cost")
            {
                ApplicationArea = All;
            }

        }
    }
    var
        S_Cost: Record Item;

    trigger OnAfterGetRecord()

    
    begin
        S_Cost.Get(Rec."No.");
    end;

}
