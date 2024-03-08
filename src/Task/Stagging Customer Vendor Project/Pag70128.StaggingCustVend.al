// page 70128 "Stagging Cust/Vend Card"
// {
//     ApplicationArea = All;
//     Caption = 'Stagging - Cust/Vend';
//     PageType = Card;
//     SourceTable = "Stagging - Cust/Vend";

//     layout
//     {
//         area(content)
//         {
//             field("Type"; Rec."Type")
//             {
//                 ToolTip = 'Specifies the value of the Type field.';
//             }
//             field(ABN; Rec.ABN)
//             {
//                 ToolTip = 'Specifies the value of the ABN field.';
//             }
//             field("ABN Division Part No."; Rec."ABN Division Part No.")
//             {
//                 ToolTip = 'Specifies the value of the ABN Division Part No. field.';
//             }
//             field(ACN; Rec.ACN)
//             {
//                 ToolTip = 'Specifies the value of the ACN field.';
//             }
//             group(General)
//             {
//                 Caption = 'General';

//                 field("No."; Rec."No.")
//                 {
//                     ToolTip = 'Specifies the value of the No. field.';
//                 }
//                 field(Name; Rec.Name)
//                 {
//                     ToolTip = 'Specifies the value of the Name field.';
//                 }
//                 field("Phone No."; Rec."Phone No.")
//                 {
//                     ToolTip = 'Specifies the value of the Phone No. field.';
//                 }
//                 field("E-mail"; Rec."E-mail")
//                 {
//                     ToolTip = 'Specifies the value of the E-mail field.';
//                 }
//                 field("Business Type"; Rec."Business Type")
//                 {
//                     ToolTip = 'Specifies the value of the Business Type field.';
//                 }
//                 field(Status; Rec.Status)
//                 {
//                     ToolTip = 'Specifies the value of the Status field.';
//                 }
//                 field("Reference No."; Rec."Reference No.")
//                 {
//                     ToolTip = 'Specifies the value of the Reference No. field.';
//                 }
//             }
//             group(Addresses)
//             {
//                 Caption = 'Address';

//                 group(OrgAddress)
//                 {
//                     Caption = 'Address';
//                     field(Address; Rec.Address)
//                     {
//                         ToolTip = 'Specifies the value of the Address field.';
//                     }
//                     field("Address 2"; Rec."Address 2")
//                     {
//                         ToolTip = 'Specifies the value of the Address 2 field.';
//                     }
//                     field("Country/Region Code"; Rec."Country/Region Code")
//                     {
//                         ToolTip = 'Specifies the value of the Country/Region Code field.';

//                         trigger OnValidate()
//                         begin
//                             IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
//                         end;
//                     }
//                     field(City; Rec.City)
//                     {
//                         ToolTip = 'Specifies the value of the City field.';
//                     }
//                     group(CustomControl2503)
//                     {
//                         ShowCaption = false;
//                         Visible = IsCountyVisible;
//                         field(County; Rec.County)
//                         {
//                             ApplicationArea = Basic, Suite;
//                             ToolTip = 'Specifies the state, province or county as a part of the address.';
//                         }
//                     }
//                     field("Post Code"; Rec."Post Code")
//                     {
//                         ToolTip = 'Specifies the value of the Post Code field.';
//                     }
//                 }

//                 group(RegisteredAddress)
//                 {
//                     Caption = 'Registered Address';
//                     field("Registered Address"; Rec."Registered Address")
//                     {
//                         ToolTip = 'Specifies the value of the Registered Address field.';
//                     }
//                     field("Registered Address 2"; Rec."Registered Address 2")
//                     {
//                         ToolTip = 'Specifies the value of the Registered Address 2 field.';
//                     }
//                     field("Registered Country/Region Code"; Rec."Registered Country/Region Code")
//                     {
//                         ToolTip = 'Specifies the value of the Registered Country/Region Code field.';

//                         trigger OnValidate()
//                         begin
//                             IsRegCountyVisible := FormatAddress.UseCounty(Rec."Registered Country/Region Code");
//                         end;
//                     }
//                     field("Registered City"; Rec."Registered City")
//                     {
//                         ToolTip = 'Specifies the value of the Registered City field.';
//                     }
//                     group(RegCustomControl2503)
//                     {
//                         ShowCaption = false;
//                         Visible = IsRegCountyVisible;
//                         field("Registered County"; Rec."Registered County")
//                         {
//                             ApplicationArea = Basic, Suite;
//                             ToolTip = 'Specifies the state, province or county as a part of the address.';
//                         }
//                     }
//                     field("Registered Post Code"; Rec."Registered Post Code")
//                     {
//                         ToolTip = 'Specifies the value of the Registered Post Code field.';
//                     }
//                 }
//             }

//             // group(ContactDetails)
//             // {
//             //     Caption = 'Contact';
//             //     field("Primary Contact No."; Rec."Primary Contact No.")
//             //     {
//             //         ApplicationArea = Basic, Suite;
//             //         Caption = 'Contact Code';
//             //         Importance = Additional;
//             //         ToolTip = 'Specifies the contact number for the customer.';
//             //     }
//             //     field(ContactName; Rec.Contact)
//             //     {
//             //         ApplicationArea = Basic, Suite;
//             //         Caption = 'Contact Name';
//             //         Editable = ContactEditable;
//             //         Importance = Promoted;
//             //         ToolTip = 'Specifies the name of the person you regularly contact when you do business with this customer.';

//             //         trigger OnValidate()
//             //         begin
//             //             ActivateFields();
//             //         end;
//             //     }
//             // }

//             group(PostingDetailsPaymentTerms)
//             {
//                 Caption = 'Posting Details & Payment Terms';
//                 field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
//                 {
//                     ApplicationArea = All;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the customer''s trade type to link transactions made for this customer with the appropriate general ledger account according to the general posting setup.';
//                 }
//                 field("Posting Group"; Rec."Posting Group")
//                 {
//                     ApplicationArea = All;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies the customer''s market type to link business transactions to.';
//                 }
//                 field("Payment Terms Code"; Rec."Payment Terms Code")
//                 {
//                     ApplicationArea = All;
//                     ShowMandatory = true;
//                     ToolTip = 'Specifies a code that indicates the payment terms that you require of the customer.';
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
//                         Customer_LRec.Reset();
//                         Customer_LRec.SetRange(ABN, Rec.ABN);
//                         Customer_LRec.SetRange("IRD No.", Rec.ACN);
//                         if Customer_LRec.FindFirst() then begin
//                             if Confirm('Do you want to modify a existing Customer for this record?', true) then
//                                 Rec.ModifyCustomerRecord(Rec);
//                         end else begin
//                             if Confirm('Do you want to create a new Customer for this record?', true) then
//                                 Rec.CreateCustomerRecord(Rec);
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
//                     if NOT Rec.ValidateVendRecord(Rec) then begin
//                         Vendor_LRec.Reset();
//                         Vendor_LRec.SetRange(ABN, Rec.ABN);
//                         Vendor_LRec.SetRange("IRD No.", Rec.ACN);
//                         if Vendor_LRec.FindFirst() then begin
//                             if Confirm('Do you want to modify a existing Vendor for this record?', true) then
//                                 Rec.ModifyVendorRecord(Rec);
//                         end else begin
//                             if Confirm('Do you want to create a new Vendor for this record?', true) then
//                                 Rec.CreateVendorRecord(Rec);
//                         end;
//                     end;
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

//     trigger OnInit()
//     begin
//         PrevCountryCode := '*';
//         ContactEditable := true;
//     end;

//     trigger OnAfterGetCurrRecord()
//     begin
//         ShowErrors();

//         if GuiAllowed then
//             ActivateFields();
//     end;

//     trigger OnAfterGetRecord()
//     begin
//         ShowErrors();
//     end;

//     procedure ActivateFields()
//     begin
//         ContactEditable := Rec."Primary Contact No." = '';
//         if Rec."Country/Region Code" <> PrevCountryCode then
//             IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
//         PrevCountryCode := Rec."Country/Region Code";
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

//     var
//         FormatAddress: Codeunit "Format Address";
//         IsCountyVisible: Boolean;
//         IsRegCountyVisible: Boolean;
//         PrevCountryCode: Code[10];

//     protected var
//         ContactEditable: Boolean;
// }