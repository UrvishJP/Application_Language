page 50100 CourseCard
{
    ApplicationArea = All;
    Caption = 'CourseCard';
    PageType = Card;
    SourceTable = Course;
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
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
                field(Duration; Rec.Duration)
                {

                }
                field(Price; Rec.Price)
                {

                }
                field(Type; Rec.Type)
                {

                }
                field(Active; Rec.Active)
                {

                }
                field("Instructor Code"; Rec."Instructor Code")
                {

                }
                field("Instructor Name"; Rec."Instructor Name")
                {

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Resource Card")
            {
                ApplicationArea = All;
                RunObject = Page "Resource Card";
                RunPageLink = "No." = FIELD("Instructor Code");
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
            }
        }
    }

}

