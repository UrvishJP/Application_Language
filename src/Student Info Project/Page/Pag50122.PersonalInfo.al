page 50122 "Personal Info"
{
    ApplicationArea = All;
    Caption = 'Personal Info';
    PageType = Card;
    SourceTable = "Student Information";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Phone no."; Rec."Phone no.")
                {
                    ToolTip = 'Specifies the value of the Phone no. field.';
                }
                field("Fav Activity"; Rec."Fav Activity")
                {
                    ToolTip = 'Specifies the value of the Fav Activity field.';
                }
                field(Country; Rec.Country)
                {
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Enrollment No."; Rec."Enrollment No.")
                {
                    ToolTip = 'Specifies the value of the Enrollment No. field.';
                }
                field("Fees per term"; Rec."Fees per term")
                {
                    ToolTip = 'Specifies the value of the Fees per term field.';
                }
                field("Physically Disabled"; Rec."Physically Disabled")
                {
                    ToolTip = 'Specifies the value of the Physically Disabled field.';
                }
                field("Term start date"; Rec."Term start date")
                {
                    ToolTip = 'Specifies the value of the Term start date field.';
                }
                field(avg; Rec.avg)
                {
                    ToolTip = 'Specifies the value of the avg field.';
                }
            }
            part(Details; CountryPage)
            {
                ApplicationArea = all;
                // SubPageLink 
            }
        }

    }
}
