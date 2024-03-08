// page 70127 "Stagging Cust/Vend List"
// {
//     ApplicationArea = All;
//     Caption = 'Stagging Customers/Vendors';
//     PageType = List;
//     SourceTable = "Stagging - Cust/Vend";
//     UsageCategory = Lists;
//     CardPageId = "Stagging Cust/Vend Card";
//     Editable = false;

//     layout
//     {
//         area(content)
//         {
//             repeater(General)
//             {
//                 field("Type"; Rec."Type")
//                 {
//                     ToolTip = 'Specifies the value of the Type field.';
//                 }
//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the value of the No. field.';
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ToolTip = 'Specifies the value of the Name field.';
//                 }
//                 field(ABN; Rec.ABN)
//                 {
//                     ToolTip = 'Specifies the value of the ABN field.';
//                 }
//                 field("ABN Division Part No."; Rec."ABN Division Part No.")
//                 {
//                     ToolTip = 'Specifies the value of the ABN Division Part No. field.';
//                 }
//                 field(ACN; Rec.ACN)
//                 {
//                     ToolTip = 'Specifies the value of the ACN field.';
//                 }
//             }
//         }
//         area(FactBoxes)
//         {
//             part(ErrorMessagesPart; "Error Messages Part")
//             {
//                 ApplicationArea = All;
//                 Caption = 'Errors and Warnings';
//                 ShowFilter = false;
//             }
//         }
//     }

//     actions
//     {
//         area(Processing)
//         {
//             action(Validate)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Validate';
//                 Image = ViewDetails;
//                 Enabled = Rec.Status = Rec.Status::Registered;

//                 trigger OnAction()
//                 begin
//                     if Rec.Type = Rec.Type::Customer then begin
//                         if NOT Rec.ValidateCustRecord(Rec) then
//                             Message('Data Successfully Validated')
//                     end
//                     else begin
//                         if NOT Rec.ValidateVendRecord(Rec) then
//                             Message('Data Successfully Validated')
//                     end;
//                 end;
//             }
//             action(CreateCustomer)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Create Customer';
//                 Image = Customer;
//                 Visible = Rec.Type = Rec.Type::Customer;
//                 Enabled = Rec.Status = Rec.Status::Registered;

//                 trigger OnAction()
//                 var
//                     Customer_LRec: Record Customer;
//                 begin
//                     if NOT Rec.ValidateCustRecord(Rec) then begin
//                         if Customer_LRec.Get(Rec."No.") then begin
//                             if Confirm('Do you want to modify a existing Customer for this record?', true) then begin
//                                 Rec.ModifyCustomerRecord(Rec);
//                                 CurrPage.Update();
//                             end;
//                         end else begin
//                             if Confirm('Do you want to create a new Customer for this record?', true) then begin
//                                 Rec.CreateCustomerRecord(Rec);
//                                 CurrPage.Update();
//                             end;
//                         end;
//                     end;
//                 end;
//             }
//             action(CreateVendor)
//             {
//                 ApplicationArea = All;
//                 Caption = 'Create Vendor';
//                 Image = Vendor;
//                 Visible = Rec.Type = Rec.Type::Vendor;
//                 Enabled = Rec.Status = Rec.Status::Registered;

//                 trigger OnAction()
//                 var
//                     Vendor_LRec: Record Vendor;
//                 begin
//                     if NOT Rec.ValidateVendRecord(Rec) then
//                         if Vendor_LRec.Get(Rec."No.") then begin
//                             if Confirm('Do you want to modify a existing Vendor for this record?', true) then begin
//                                 Rec.ModifyVendorRecord(Rec);
//                                 CurrPage.Update();
//                             end;
//                         end else begin
//                             if Confirm('Do you want to create a new Vendor for this record?', true) then begin
//                                 Rec.CreateVendorRecord(Rec);
//                                 CurrPage.Update();
//                             end;
//                         end;
//                 end;
//             }
//         }

//         area(Promoted)
//         {
//             actionref(Validate_Promoted; Validate)
//             {
//             }
//             actionref(Customer_Promoted; CreateCustomer)
//             {
//             }
//             actionref(Vendor_Promoted; CreateVendor)
//             {
//             }
//         }
//     }

//     trigger OnAfterGetCurrRecord()
//     begin
//         ShowErrors();
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         ShowErrors();
//     end;

//     trigger OnOpenPage()
//     begin
//         Rec.SetFilter("Cust/Vend Created", 'false');
//     end;

//     local procedure ShowErrors()
//     var
//         ErrorMessage: Record "Error Message";
//         TempErrorMessage: Record "Error Message" temporary;
//     begin
//         ErrorMessage.SetRange("Context Record ID", Rec.RecordId);
//         ErrorMessage.CopyToTemp(TempErrorMessage);
//         CurrPage.ErrorMessagesPart.PAGE.SetRecords(TempErrorMessage);
//         CurrPage.ErrorMessagesPart.PAGE.Update(false);
//     end;
// }
