page 50220 "Multiple Copies of Report"
{
    ApplicationArea = All;
    Caption = 'Multiple Copies of Report';
    PageType = List;
    SourceTable = "Multiple Copies of Report";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Item Name"; Rec."Item Name")
                {
                    ToolTip = 'Specifies the value of the Item Name field.';
                }
                field(Price; Rec.Price)
                {
                    ToolTip = 'Specifies the value of the Price field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Print Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Report.RunModal(Report::"Multiple Copies of Report");
                end;
            }
        }
    }

}
