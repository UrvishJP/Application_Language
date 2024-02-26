page 50157 "Stream List"
{
    ApplicationArea = All;
    Caption = 'Stream List';
    PageType = List;
    SourceTable = Stream;
    UsageCategory = Lists;
    CardPageId = "Stream Card";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Type"; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Total Marks"; Rec."Total Marks")
                {
                    ToolTip = 'Specifies the value of the Total Marks field.';
                }
            }
        }
    }
}
