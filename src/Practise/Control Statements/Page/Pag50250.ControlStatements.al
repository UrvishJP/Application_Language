page 50250 "Control Statements"
{
    ApplicationArea = All;
    Caption = 'Control Statements';
    PageType = Card;
    SourceTable = "Control Statements Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Integer; Rec.Integer)
                {

                }
                field(Option; Rec.Option)
                {

                }
                field(Name; Rec.Name)
                {

                }
                field(Code; Rec.Code)
                {

                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Case for Number")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()

                begin
                    case Rec.Integer of
                        1, 2, 3:
                            message('1, 2 or 3.');
                        10 .. 100:
                            message('In the range from 10 to 100.');
                        else
                            message('Neither 1, 2, 3 nor in the range from 10 to 100.');
                    end;
                end;
            }
            action("Case for Option")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()

                begin
                    case Rec.Option of
                        Rec.Option::Option1:
                            Message('You have selected Option1.');
                        Rec.Option::Option2:
                            Message('You have selected Option2.');
                        else
                            Message('Please select the Option.');
                    end;
                end;
            }
            action("Case for Code")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()

                begin
                    case Rec.Code of
                        '1':
                            message('1');
                        '2':
                            message('2');
                        else
                            message('Neither 1 nor 2.');
                    end;
                end;
            }
            action("For to do")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Count: Integer;
                begin
                    for Count := 1 to 3 do
                        Message('%1', Count);
                end;
            }
            action("For downto do")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Count: Integer;
                begin
                    for Count := 3 downto 1 do
                        Message('%1', Count);
                end;
            }
            action("Repeat Until")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()

                var
                    Count: Integer;

                begin
                    Count := 1;

                    repeat
                        Message('%1', Count);
                        Count += 1;
                    until Count = 5;
                end;
            }

            action("ForEach in do")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    StringList: List of [Text];
                    StringItem: Text;

                begin
                    StringList.Add('Urvish');
                    StringList.Add('Priyank');
                    StringList.Add('Deep');

                    foreach StringItem in StringList do
                        Message(StringItem);
                end;
            }
            action("While do")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()

                var
                    Count: Integer;

                begin
                    Count := 1;

                    while Count < 5 do begin
                        Message('%1', Count);
                        Count += 1;
                    end;
                end;
            }
            action("Break")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                var
                    Count: Integer;
                begin
                    for Count := 1 to 5 do begin
                        Message('%1', Count);
                        if Count = 3 then
                            break;
                    end;
                end;
            }
        }
    }
}
