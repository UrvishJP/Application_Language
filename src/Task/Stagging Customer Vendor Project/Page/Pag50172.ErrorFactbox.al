page 50172 "Error Factbox"
{
    ApplicationArea = All;
    Caption = 'Error Factbox';
    PageType = ListPart;
    SourceTable = "Error Message";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(MsgType; Rec."Message Type")
                {
                    ApplicationArea = all;
                }
                field(FieldName; Rec."Field Name")
                {
                    ApplicationArea = all;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = all;
                    Style = Attention;
                }
            }
        }
    }

    trigger OnOpenPage()

    begin
        Rec.DeleteAll();
    end;

}
