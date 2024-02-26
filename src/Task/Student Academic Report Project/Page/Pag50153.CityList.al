page 50153 "City List"
{
    ApplicationArea = All;
    Caption = 'City List';
    PageType = List;
    SourceTable = City;
    UsageCategory = Lists;
    CardPageId = "City Card";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("City ID"; Rec."City ID")
                {
                    ToolTip = 'Specifies the value of the City ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }
}
