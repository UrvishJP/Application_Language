pageextension 50128 "General Journal Ext" extends "General Journal"
{
    layout
    {

        addafter("Document Type")
        {
            field("Transaction Type"; Rec."Transaction_Type")
            {
                ApplicationArea = All;
                Editable = Rec."Document Type" = Rec."Document Type"::Payment;


            }
        }
        

    }
}


