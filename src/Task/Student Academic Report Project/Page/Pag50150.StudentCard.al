page 50150 "Student Card"
{
    ApplicationArea = All;
    Caption = 'Student Card';
    PageType = Card;
    SourceTable = Student;
    PromotedActionCategories = '1,2,3,Print Report';

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.';

                }
                field("Total Marks"; Rec."Total Marks")
                {
                    ToolTip = 'Specifies the value of the Total Marks field.';
                }
                field("Obtain Marks"; Rec."Obtain Marks")
                {
                    ToolTip = 'Specifies the value of the Obtain Marks field.';
                }
                field("School Name"; Rec."School Name")
                {
                    ToolTip = 'Specifies the value of the School Name field.';
                }
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Print Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()
                begin
                    CurrPage.SetSelectionFilter(Rec);
                    Report.RunModal(Report::"Academic Report",true,true,Rec);
                end;
            }
        }
    }
}
