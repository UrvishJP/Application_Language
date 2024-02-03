page 50121 CountrytoState
{
    ApplicationArea = All;
    Caption = 'Country To State';
    PageType = ListPart;
    SourceTable = Country;
    // Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(State; Rec.State)
                {
                    ToolTip = 'Specifies the value of the State field.';

                    trigger OnDrillDown()
                    var
                        Country: Record Country;
                    begin
                        Country.Reset();
                        Country.SetRange(Country, Rec.Country);
                        Country.SetRange(State, Rec.State);
                        Page.RunModal(Page::StateToCity, Country);
                    end;
                }
            }
        }
    }
}
