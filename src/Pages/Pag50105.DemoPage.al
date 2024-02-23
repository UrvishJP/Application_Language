page 50110 DemoPage
{
    ApplicationArea = All;
    Caption = 'DemoPage';
    PageType = List;
    SourceTable = DemoTable;
    // CardPageId = CourseList;


    // (1)
    // UsageCategory = None;
    UsageCategory = Lists;
    // UsageCategory = Tasks;
    // UsageCategory = Administration;
    // UsageCategory = ReportsAndAnalysis;
    // UsageCategory = Documents;
    // UsageCategory = History;
    // Applies to :  Page, Query and Report




    // (2)
    // DelayedInsert = True;





    //(3)
    // ModifyAllowed = false;





    //(4)
    // SourceTableTemporary = true;

    // A temporary table data isn't stored in the database. 
    // It's only held in memory until the table is closed.


    layout
    {
        area(content)
        {
            repeater(General)
            {
                Caption = 'General';

                field(Urvish; Rec.Urvish)
                {
                    ToolTip = 'Specifies the value of the Urvish field.';
                    TableRelation = DemoTable;

                    // AssistEdit = true;
                    // RowSpan = 2;
                    // HideValue = true;
                    // ExtendedDatatype = Masked;
                    // Importance = Promoted;
                    // Lookup =
                    // MultiLine = true;
                    // QuickEntry = false;
                    // ShowCaption = false;
                    // ShowMandatory = true;
                    // Style = Ambiguous;
                    // StyleExpr = 
                    // Visible = false;
                    // HideValue = true;


                }
                field(Devam; Rec.Devam)
                {
                    ToolTip = 'Specifies the value of the Devam field.';

                    trigger OnDrillDown()

                    begin
                        Page.RunModal(Page::"Student Info Page");
                    end;
                }

                field(Yash; Rec.Yash)
                {
                    ToolTip = 'Specifies the value of the Yash field.';

                    trigger OnAssistEdit()
                    var
                        myInt: Integer;
                    begin
                        // Page.RunModal(Page::"Student Info Page");
                        Rec.Yash := 'yash';
                    end;
                }


            }

        }
    }

    // trigger OnAfterGetRecord()

    // begin
    //     Message('Get - %1',Rec.Urvish);
    // end;

    // trigger OnAfterGetCurrRecord()

    // begin
    //     Message('Curr - %1',rec.Urvish);
    // end;
    

}