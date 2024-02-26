page 50156 "Stream Card"
{
    ApplicationArea = All;
    Caption = 'Stream Card';
    PageType = Card;
    SourceTable = Stream;
    UsageCategory = Documents;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
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
