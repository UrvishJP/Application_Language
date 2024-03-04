report 50171 "External Doc No"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Invoice Modify';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            dataitem(CustLedEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Document No." = field("No.");

                trigger OnPreDataItem()
                begin
                    SetRange(CustLedEntry."Document No.", SalesInvoiceHeader."No.");
                end;

                trigger OnAfterGetRecord()

                begin
                    CustLedEntry."External Document No." := SalesInvoiceHeader."External Document No.";
                    CustLedEntry.Modify();
                end;
            }
            trigger OnPreDataItem()

            begin
                if (Invoice_Number = '') then
                    Error('Please enter Invoice Number');

                if (External_Code = '') then
                    Error('Please enter External Code');

            end;

            trigger OnAfterGetRecord()

            begin
                if SalesInvoiceHeader."No." = Invoice_Number then begin
                    SalesInvoiceHeader."External Document No." := External_Code;
                    SalesInvoiceHeader.Modify();
                end;
            end;

            trigger OnPostDataItem()

            begin
                Message('External Document of Sales Invoice No. %1 is changed to %2', Invoice_Number, External_Code);
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group("Sales Invoice Filteration")
                {
                    field("Invoice Number"; Invoice_Number)
                    {
                        ApplicationArea = All;
                        TableRelation = "Sales Invoice Header";

                    }
                    field("Extrenal Code"; External_Code)
                    {
                        ApplicationArea = All;

                        trigger OnValidate()

                        begin
                            if (Invoice_Number = '') then
                                Error('Please select Invoice Number.');
                        end;
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
        Invoice_Number: Text[50];
        External_Code: Text[50];
}
