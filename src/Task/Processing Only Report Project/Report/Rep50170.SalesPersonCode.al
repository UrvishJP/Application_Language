report 50170 "Sales Person Code"
{
    ApplicationArea = All;
    Caption = 'Sales Person Code Modify';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {

            trigger OnPreDataItem()

            begin
                if (Old_Person = '') OR (New_Person = '') then
                    Error('Field is empty.');

                if Old_Person = New_Person then
                    Error('Both fields can''t be same.');

                ChangesConter := 0;

                SetRange(SalesInvoiceHeader."Salesperson Code", Old_Person);

            end;

            trigger OnAfterGetRecord()

            begin
                SalesInvoiceHeader."Salesperson Code" := New_Person;
                SalesInvoiceHeader.Modify();
                ChangesConter := ChangesConter + 1;
            end;

            trigger OnPostDataItem()

            begin
                Message('Number of rows changed from Old_Person to New_Person : %1', ChangesConter);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Sales Person Code")
                {
                    field("Old Sales Person"; Old_Person)
                    {
                        ApplicationArea = All;
                        TableRelation = "Salesperson/Purchaser";
                    }
                    field("New Sales Person"; New_Person)
                    {
                        ApplicationArea = All;
                        TableRelation = "Salesperson/Purchaser";
                    }
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
    var
        Old_Person: Text[50];
        New_Person: Text[50];
        ChangesConter: Integer;
}
