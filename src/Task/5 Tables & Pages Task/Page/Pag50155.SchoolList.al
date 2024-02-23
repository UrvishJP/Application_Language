page 50155 "School List"
{
    ApplicationArea = All;
    Caption = 'School List';
    PageType = List;
    SourceTable = School;
    UsageCategory = Lists;
    CardPageId = "School Card";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
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
