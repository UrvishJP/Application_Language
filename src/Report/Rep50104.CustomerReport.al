report 50104 "Customer Report"
{
    ApplicationArea = All;
    Caption = 'Customer Report';
    UsageCategory = ReportsAndAnalysis;
    WordLayout = 'Customer Report.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            {
            }
            column(Name; Name)
            {
            }
            column(Address; Address)
            {
            }
            column(SalesLCY; "Sales (LCY)")
            {
            }
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
}
