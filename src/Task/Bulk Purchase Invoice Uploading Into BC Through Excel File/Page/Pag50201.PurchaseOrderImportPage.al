page 50201 "Purchase Order Import Page"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Import Page';
    PageType = Worksheet;
    SourceTable = "Purchase Order Import Table";
    UsageCategory = Documents;
    InsertAllowed = false;

    layout
    {
        area(content)
        {
            field("Batch Name"; BName)
            {
                ApplicationArea = all;

                trigger OnLookup(var Text: Text): Boolean

                begin
                    if Page.RunModal(Page::"Purchase Order Import Batches", Batches) = Action::LookupOK then begin
                        BName := Batches.Name;
                        ChangeBatch();
                    end;
                end;

                trigger OnValidate()

                begin
                    ChangeBatch();
                end;
            }

            repeater(General)
            {
                field("Imported Vendor No."; Rec."Imported Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Imported Vendor No. field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Item No."; Rec."Imported Item No.")
                {
                    ToolTip = 'Specifies the value of the Imported Item No. field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Location Code"; Rec."Imported Location Code")
                {
                    ToolTip = 'Specifies the value of the Imported Location Code field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to Country Code"; Rec."Imported Ship-to Country Code")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Country Code field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Shipping Agent Code"; Rec."Imported Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Imported Shipping Agent Code field.';
                    StyleExpr = StyleExpresion;
                }
                field(ImportedShippingAgentService; Rec.ImportedShippingAgentService)
                {
                    ToolTip = 'Specifies the value of the Imported Shipping Agent Service field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported External Document No."; Rec."Imported External Document No.")
                {
                    ToolTip = 'Specifies the value of the Imported External Document No. field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Shipment Date"; Rec."Imported Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Imported Shipment Date field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to Name"; Rec."Imported Ship-to Name")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Name field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to Address"; Rec."Imported Ship-to Address")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Address field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to Address 2"; Rec."Imported Ship-to Address 2")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Address 2 field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to City"; Rec."Imported Ship-to City")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to City field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to State"; Rec."Imported Ship-to State")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to State field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Ship-to Post Code"; Rec."Imported Ship-to Post Code")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Post Code field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Item Quantity"; Rec."Imported Item Quantity")
                {
                    ToolTip = 'Specifies the value of the Imported Item Quantity field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Item Unit Price"; Rec."Imported Item Unit Price")
                {
                    ToolTip = 'Specifies the value of the Imported Item Unit Price field.';
                    StyleExpr = StyleExpresion;
                }
                field("Imported Line Discount Amount"; Rec."Imported Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Imported Line Discount Amount field.';
                    StyleExpr = StyleExpresion;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                    StyleExpr = StyleExpresion;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    StyleExpr = StyleExpresion;
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                    StyleExpr = StyleExpresion;
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Code field.';
                    StyleExpr = StyleExpresion;
                }
                field("Shipping Agent Service"; Rec."Shipping Agent Service")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service field.';
                    StyleExpr = StyleExpresion;
                }
            }


            part("Error and Warnings"; "Error and Warning")
            {
                ApplicationArea = All;
            }


        }

    }
    actions
    {
        area(Processing)
        {
            action("Import Purchase Order")
            {
                ApplicationArea = All;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()

                begin
                    if (Rec."Batch Name" <> '') then begin
                        ImpBatchs.Get(BName);
                        ImpBatchs.TestField("Reading CodeUnit");
                        Codeunit.Run(ImpBatchs."Reading CodeUnit", ImpBatchs);
                        Rec.Reset();
                        Rec.SetRange("Batch Name", BName);
                    end
                    else
                        Message('Please select Batch Name first.');
                end;
            }
            action("Validate Data")
            {
                ApplicationArea = All;
                Image = ViewCheck;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()

                begin

                    ValidateData();
                    if ErrorMsg.IsEmpty() then begin
                        Message('Data Successfully Validated......No error found.');
                    end
                    else
                        Message('Error found in data.');
                end;
            }
            action("Create Purchase Order")
            {
                ApplicationArea = All;
                Image = Purchase;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()

                begin
                    ValidateData();
                    Rec.Reset();
                    Rec.SetRange("Batch Name", BName);
                    ImpBatchs.Get(BName);
                    ImpBatchs.TestField("Processing CodeUnit");
                    Codeunit.Run(ImpBatchs."Processing CodeUnit", Rec);
                end;
            }
            action("Export Layout")
            {
                ApplicationArea = All;
                Image = Excel;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()

                begin
                    ImportExportData.ExportToExcel(Rec);
                end;
            }
            action("Delete Record")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Delete;
                trigger OnAction()
                var

                begin
                    if Confirm('Do you want to delete all Records?') then
                        if Rec.FindSet() then
                            Rec.DeleteAll();
                end;

            }

        }
    }

    procedure ChangeBatch()

    begin
        Batches.Get(BName);

        CurrPage.SaveRecord();
        Rec.Reset();
        Rec.SetRange("Batch Name", BName);

        CurrPage.Update(false);
    end;

    procedure ValidateData()
    begin
        ErrorMsg.DeleteAll();
        Rec.SetRange("Batch Name", BName);
        if Rec.FindSet() then begin
            repeat
                ImpBatchs.Get(BName);
                ImpBatchs.TestField("Validation CodeUnit");
                Codeunit.Run(ImpBatchs."Validation CodeUnit", Rec);
            until Rec.Next() = 0;
        end;

    end;

    trigger OnAfterGetRecord()

    begin

        if ErrorAndWarnings.ChangeStyle(Rec) then begin
            StyleExpresion := 'Unfavorable';
        end
        else
            StyleExpresion := 'Standard';
    end;

    trigger OnOpenPage()

    begin
        BName := 'Default';
        Rec.SetFilter("Batch Name", BName);
    end;


    var
        ImportExportData: Codeunit "Import Export Data";
        ErrorAndWarnings: Codeunit "Error and Warning CodeUnit";
        ErrorMsg: Record "Error Message";
        Batches: Record "Purchase Order Import Batches";
        CreatePurchase: Codeunit "Processing CodeUnit";
        ImpBatchs: Record "Purchase Order Import Batches";
        BName: Text[50];
        StyleExpresion: Text[50];
}
