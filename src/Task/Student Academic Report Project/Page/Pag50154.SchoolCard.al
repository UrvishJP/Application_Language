page 50154 "School Card"
{
    ApplicationArea = All;
    Caption = 'School Card';
    PageType = Card;
    SourceTable = School;
    UsageCategory = Documents;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("School ID"; Rec."School ID")
                {
                    ToolTip = 'Specifies the value of the School ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}
