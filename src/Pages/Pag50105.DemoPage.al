page 50110 DemoPage
{
    ApplicationArea = All;
    Caption = 'DemoPage';
    PageType = List;
    SourceTable = DemoTable;


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
    DelayedInsert = True;





    //(3)
    // ModifyAllowed = false;





    //(4)
    SourceTableTemporary = true;

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
                }
                field(Devam; Rec.Devam)
                {
                    ToolTip = 'Specifies the value of the Devam field.';
                }

                field(Yash; Rec.Yash)
                {
                    ToolTip = 'Specifies the value of the Yash field.';
                }
            }
        }
    }
}
