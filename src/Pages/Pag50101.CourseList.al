page 50101 CourseList
{
    ApplicationArea = All;
    Caption = 'CourseList';
    PageType = List;
    SourceTable = Course;
    UsageCategory = Documents;
    Editable = false;
    // CardPageId = CourseCard;

    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(Code; Rec.Code)
                {
                   
                }
                field(Name; Rec.Name)
                {
                   
                }
                field(Description; Rec.Description)
                {
                   
                }
            }
        }
    }
}
