page 50152 "City Card"
{
    ApplicationArea = All;
    Caption = 'City Card';
    PageType = Card;
    SourceTable = City;
    UsageCategory = Documents;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
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
