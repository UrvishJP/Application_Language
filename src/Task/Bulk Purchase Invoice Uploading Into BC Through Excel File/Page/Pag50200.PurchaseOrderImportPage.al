page 50200 "Purchase Order Import Page"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Import Page';
    PageType = Worksheet;
    SourceTable = "Purchase Order Import Table";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {

            field("Batch Name"; Rec."Batch Name")
            {
                ApplicationArea = all;

            }

            repeater(General)
            {
                field("Imported Vendor No."; Rec."Imported Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Imported Vendor No. field.';
                }
                field("Imported Item No."; Rec."Imported Item No.")
                {
                    ToolTip = 'Specifies the value of the Imported Item No. field.';
                }
                field("Imported Location Code"; Rec."Imported Location Code")
                {
                    ToolTip = 'Specifies the value of the Imported Location Code field.';
                }
                field("Imported Ship-to Country Code"; Rec."Imported Ship-to Country Code")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Country Code field.';
                }
                field("Imported Shipping Agent Code"; Rec."Imported Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Imported Shipping Agent Code field.';
                }
                field(ImportedShippingAgentService; Rec.ImportedShippingAgentService)
                {
                    ToolTip = 'Specifies the value of the Imported Shipping Agent Service field.';
                }
                field("Imported External Document No."; Rec."Imported External Document No.")
                {
                    ToolTip = 'Specifies the value of the Imported External Document No. field.';
                }
                field("Imported Shipment Date"; Rec."Imported Shipment Date")
                {
                    ToolTip = 'Specifies the value of the Imported Shipment Date field.';
                }
                field("Imported Ship-to Name"; Rec."Imported Ship-to Name")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Name field.';
                }
                field("Imported Ship-to Address"; Rec."Imported Ship-to Address")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Address field.';
                }
                field("Imported Ship-to Address 2"; Rec."Imported Ship-to Address 2")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Address 2 field.';
                }
                field("Imported Ship-to City"; Rec."Imported Ship-to City")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to City field.';
                }
                field("Imported Ship-to State"; Rec."Imported Ship-to State")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to State field.';
                }
                field("Imported Ship-to Post Code"; Rec."Imported Ship-to Post Code")
                {
                    ToolTip = 'Specifies the value of the Imported Ship-to Post Code field.';
                }
                field("Imported Item Quantity"; Rec."Imported Item Quantity")
                {
                    ToolTip = 'Specifies the value of the Imported Item Quantity field.';
                }
                field("Imported Item Unit Price"; Rec."Imported Item Unit Price")
                {
                    ToolTip = 'Specifies the value of the Imported Item Unit Price field.';
                }
                field("Imported Line Discount Amount"; Rec."Imported Line Discount Amount")
                {
                    ToolTip = 'Specifies the value of the Imported Line Discount Amount field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Order Date"; Rec."Order Date")
                {
                    ToolTip = 'Specifies the value of the Order Date field.';
                }
                field("Shipping Agent Code"; Rec."Shipping Agent Code")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Code field.';
                }
                field("Shipping Agent Service"; Rec."Shipping Agent Service")
                {
                    ToolTip = 'Specifies the value of the Shipping Agent Service field.';
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
                    ImportExportData.ReadData();
                    ImportExportData.ImpFromExcel();
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
                    ErrorMsg.DeleteAll();
                    ErrorAndWarnings.ValidateFields(Rec);

                    if (NOT ErrorAndWarnings.ValidateFields(Rec)) then
                        Message('Data Successfully Validated.');
                end;
            }
            action("Create Purchase Order")
            {
                ApplicationArea = All;
                Image = Purchase;
                Promoted = true;
                PromotedCategory = Process;


                trigger OnAction()

                var
                    PurchaseOrder: Record "Purchase Header";

                begin

                    if (Rec."Imported Vendor No." = PurchaseOrder."Buy-from Vendor No.") then begin

                        PurchaseOrder."Buy-from Address" := Rec."Imported Ship-to Address";
                        PurchaseOrder."Buy-from Address 2" := Rec."Imported Ship-to Address 2";
                        PurchaseOrder.Insert();
                        PurchaseOrder.Modify();

                    end;
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

        }
    }

    var
        ImportExportData: Codeunit "Import Export Data";
        ErrorAndWarnings: Codeunit "Error and Warning CodeUnit";
        ErrorMsg: Record "Error Message";

}
