page 50202 "Purchase Order Import Batches"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Import Batches';
    PageType = List;
    SourceTable = "Purchase Order Import Batches";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Reading CodeUnit"; Rec."Reading CodeUnit")
                {
                    ToolTip = 'Specifies the value of the Reading CodeUnit field.';
                }
                field("Validation CodeUnit"; Rec."Validation CodeUnit")
                {
                    ToolTip = 'Specifies the value of the Validation CodeUnit field.';
                }
                field("Processing CodeUnit"; Rec."Processing CodeUnit")
                {
                    ToolTip = 'Specifies the value of the Processing CodeUnit field.';
                }
            }
        }
    }
}
