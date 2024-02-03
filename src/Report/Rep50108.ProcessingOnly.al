report 50108 ProcessingOnly
{
    Caption = 'ProcessingOnly';
    ProcessingOnly = true;

    dataset
    {
        dataitem(Customer; Customer)
        {
            trigger OnPreDataItem();
            begin
                clear(Customer);
                clear(Counter);
                if not ReplaceExisting then
                    Customer.SetRange("Name 2", '');
            end;

            trigger OnAfterGetRecord();
            begin
                if Customer2.get(Customer."No.") then begin
                    Customer2."Name 2" := Name2ToApply;
                    Customer2.Modify;
                    Counter += 1;
                end;
            end;

            trigger OnPostDataItem();
            begin
                Message('Ready!, %1 Customers were updated.', Counter);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(Name2ToApply; Name2ToApply)
                    {
                        ApplicationArea = All;
                        Caption = 'Name2ToApply';
                        ToolTip = 'Specifies Name2 To Apply.';
                    }
                    field(ReplaceExisting; ReplaceExisting)
                    {
                        ApplicationArea = All;
                        Caption = 'ReplaceExisting';
                        ToolTip = 'ReplaceExisting';
                    }
                }
            }
        }
    }
    var
        Name2ToApply: Text;
        Customer2: Record Customer;
        ReplaceExisting: Boolean;
        Counter: Integer;
}
