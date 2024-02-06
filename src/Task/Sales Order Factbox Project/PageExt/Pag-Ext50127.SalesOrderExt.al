pageextension 50127 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter(Control1906127307)
        {
            part("Subtitude Item Detail"; "Subtitude Item Detail")
            {
                ApplicationArea = all;
                Provider=SalesLines;
                SubPageLink="No."=field("No.");
            }
        }
    }
}

