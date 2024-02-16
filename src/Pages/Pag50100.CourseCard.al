page 50100 CourseCard
{
    ApplicationArea = All;
    Caption = 'CourseCard';
    PageType = Card;
    SourceTable = Course;
    UsageCategory = Documents;
    PromotedActionCategories = '1,2,3,Convert String, Copy String';

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
            action("String Length")
            {
                trigger OnAction()

                begin
                    Message('String Length is : %1', StrLen(Format((Rec.Price))));
                end;
            }
            action("String Menu")
            {
                trigger OnAction()

                begin
                    Message(Format(StrMenu('A, C')));
                end;
            }
            action("SubString No")
            {
                trigger OnAction()

                begin
                    // Message(StrSubstNo('%1 = %2', 1));
                    // Message('%1 = %2', 1);

                    Rec.FieldError(Code, StrSubstNo('%1 = %2', 1));
                    //StrSubstNo only use with FieldError
                    // Rec.FieldError(Code, '%1 = %2', 1);
                end;
            }
            action("Inc String")
            {
                trigger OnAction()

                begin
                    Message(IncStr(Rec.Name));
                end;
            }
            action("Ins String")
            {
                trigger OnAction()

                begin
                    Message(InsStr(Rec.Name, 'QQ', 2));
                end;
            }
            action("Max String Length")
            {
                trigger OnAction()

                begin
                    Message('%1', MaxStrLen(Rec.Name));
                end;
            }
            action("Pad String")
            {
                trigger OnAction()

                begin
                    Message(PadStr(Rec.Name, 10, 'Q'));
                end;
            }
            action("Copy String")
            {
                trigger OnAction()

                begin
                    Message(CopyStr(Rec.Name, 1, 3));
                end;
            }
            action("Convert String")
            {
                Promoted = true;
                PromotedOnly = true;
                PromotedCategory = Category4;
                trigger OnAction()

                begin
                    Message(ConvertStr(Rec.Name, 'x', 's'));
                end;
            }
            action("UpperCase")
            {
                trigger OnAction()

                begin
                    Message(UpperCase(Rec.Name));
                end;
            }
            action("LowerCase")
            {
                trigger OnAction()

                begin
                    Message(LowerCase(Rec.Name));
                end;
            }
        }
    }

}

