page 50102 StateToCity
{
    ApplicationArea = All;
    Caption = 'State To City';
    PageType = List;
    SourceTable = Country;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';
                }
            }
        }
    }
}
