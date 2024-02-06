page 50126 "Subtitude Item Detail"
{
    ApplicationArea = All;
    Caption = 'Subtitude Item Detail';
    PageType = CardPart;
    SourceTable = "Item Substitution";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Substitute Type"; Rec."Substitute Type")
                {
                    ApplicationArea = All;
                }
                field("Substitute No."; Rec."Substitute No.")
                {
                    ApplicationArea = All;
                }
                field("Quantity"; Info.Inventory)
                {
                    ApplicationArea = All;
                }
                
            }
        }
    }

    var
        Info : Record Item;

        trigger OnAfterGetRecord()
       
        begin
            Info.get(Rec."Substitute No.");
            Info.CalcFields(Inventory);
        end;

}
