page 50119 "Student Info Page"
{
    ApplicationArea = All;
    Caption = 'Student Info Page';
    PageType = List;
    SourceTable = "Student Information";
    UsageCategory = Lists;
    CardPageId = "Personal Info";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Enrollment No."; Rec."Enrollment No.")
                {
                    ToolTip = 'Specifies the value of the Enrollment No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                    // Editable = false;
                    // trigger OnDrillDown()
                    // var
                    //     Country: Record Country;
                    // begin
                    //     Country.Reset();
                    //     Country.SetRange(Country, Rec.Country);
                    //     Page.RunModal(Page::CountrytoState, Country);
                    // end;
                }

                field("Fav Activity"; Rec."Fav Activity")
                {
                    ToolTip = 'Specifies the value of the Fav Activity field.';
                }
                field("Fees per term"; Rec."Fees per term")
                {
                    ToolTip = 'Specifies the value of the Fees per term field.';

                }
                field(avg; Rec.avg)
                {

                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.';
                }

                field("Phone no."; Rec."Phone no.")
                {
                    ToolTip = 'Specifies the value of the Phone no. field.';

                    Numeric = true;
                    trigger OnValidate()
                    var
                        PhoneNo: Text[20];
                    begin
                        PhoneNo := Rec."Phone no.";

                        // Validate for exactly 10 digits
                        if STRLEN(PhoneNo) <> 10 then
                            Error('Invalid phone number format. Please enter exactly 10 digits.');

                    end;

                }
                field("Physically Disabled"; Rec."Physically Disabled")
                {
                    ToolTip = 'Specifies the value of the Physically Disabled field.';
                }
                field("Term start date"; Rec."Term start date")
                {
                    ToolTip = 'Specifies the value of the Term start date field.';
                }
                
            }
        }

        area(FactBoxes)
        {
            part(Details; CountryPage)
            {
                ApplicationArea = all;
                SubPageLink = Country = field(Country);
            }
        }
    }
}
