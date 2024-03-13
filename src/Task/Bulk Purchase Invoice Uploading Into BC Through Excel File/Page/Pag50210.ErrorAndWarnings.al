page 50210 "Error and Warning"
{
    ApplicationArea = All;
    Caption = 'Error and Warnings';
    PageType = ListPart;
    SourceTable = "Error Message";
    Editable = false;

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
