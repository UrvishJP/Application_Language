report 50220 "Multiple Copies of Report"
{
    ApplicationArea = All;
    Caption = 'Multiple Copies of Report';
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = Normal;
    DefaultRenderingLayout = RDLCLayout;

    dataset
    {
        dataitem(MultipleCopiesofReport; "Multiple Copies of Report")
        {
            RequestFilterFields = No;
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {

                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(No; MultipleCopiesofReport.No)
                    {
                    }
                    column(ItemName; MultipleCopiesofReport."Item Name")
                    {
                    }
                    column(Price; MultipleCopiesofReport.Price)
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                }
                trigger OnAfterGetRecord();
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPreDataItem();
                begin
                    NoOfLoops := ABS(NoOfCopies);
                    CopyText := '';
                    SETRANGE(Number, 1, NoOfLoops);
                    OutputNo := 1;
                end;
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
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Advanced;
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
    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Task/Multiple Copies of Report Project/Report/Multiple Copies of Report Project.RDL';
        }
    }
    var
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
}
