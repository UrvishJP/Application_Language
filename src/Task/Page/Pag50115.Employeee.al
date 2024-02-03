page 50115 Employeee
{
    ApplicationArea = All;
    Caption = 'Employeee';
    PageType = List;
    SourceTable = Employeee;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(Company_ID; Rec.Company_ID)
                {
                    ToolTip = 'Specifies the value of the Company_ID field.';
                }
                field(DOB; Rec.DOB)
                {
                    ToolTip = 'Specifies the value of the DOB field.';
                }
                field("Dept."; Rec."Dept.")
                {
                    ToolTip = 'Specifies the value of the Dept. field.';
                }
                field(Experience; Rec.Experience)
                {
                    ToolTip = 'Specifies the value of the Experience field.';
                }
                field(Hobby; Rec.Hobby)
                {
                    ToolTip = 'Specifies the value of the Hobby field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Salary; Rec.Salary)
                {
                    ToolTip = 'Specifies the value of the Salary field.';
                }
            }
        }
    }
}
