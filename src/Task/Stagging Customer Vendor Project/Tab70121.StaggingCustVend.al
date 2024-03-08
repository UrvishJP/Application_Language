// table 70121 "Stagging - Cust/Vend"
// {
//     Caption = 'Stagging - Cust/Vend';
//     DataClassification = ToBeClassified;
//     DataCaptionFields = Type, ABN;

//     fields
//     {
//         field(1; "Entry No."; Integer)
//         {
//             Caption = 'Entry No.';
//             AutoIncrement = true;
//         }
//         field(2; "Type"; Enum "Stagging Type")
//         {
//             Caption = 'Type';
//         }
//         field(3; ABN; Text[11])
//         {
//             Caption = 'ABN';

//             trigger OnValidate()
//             var
//                 ABNManagement: Codeunit "ABN Management";
//             begin
//                 if Type = Type::Customer then
//                     ABNManagement.CheckABN(ABN, 0);

//                 if Type = Type::Vendor then
//                     ABNManagement.CheckABN(ABN, 1);
//             end;
//         }
//         field(4; ACN; Text[30])
//         {
//             Caption = 'ACN';
//         }
//         field(5; "ABN Division Part No."; Text[3])
//         {
//             Caption = 'ABN Division Part No.';
//         }
//         field(6; "No."; Code[20])
//         {
//             Caption = 'No.';
//         }
//         field(7; Name; Text[100])
//         {
//             Caption = 'Name';
//         }
//         field(8; "Phone No."; Text[30])
//         {
//             Caption = 'Phone No.';
//         }
//         field(9; "Business Type"; Enum "Business Type")
//         {
//             Caption = 'Business Type';
//         }
//         field(10; Status; Enum "Customer Status")
//         {
//             Caption = 'Status';
//         }
//         field(11; "Reference No."; Code[20])
//         {
//             Caption = 'Reference No.';
//         }
//         field(12; "Registered Address"; Text[100])
//         {
//             Caption = 'Address';
//         }
//         field(13; "Registered Address 2"; Text[50])
//         {
//             Caption = 'Address 2';
//         }
//         field(14; "Registered Country/Region Code"; Code[10])
//         {
//             Caption = 'Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(15; "Registered City"; Text[30])
//         {
//             Caption = 'City';
//             TableRelation = IF ("Registered Country/Region Code" = CONST('')) "Post Code".City
//             ELSE
//             IF ("Registered Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Registered Country/Region Code"));
//             ValidateTableRelation = false;

//             trigger OnLookup()
//             begin
//                 PostCode.LookupPostCode("Registered City", "Registered Post Code", "Registered County", "Registered Country/Region Code");
//             end;

//             trigger OnValidate()
//             var
//                 myInt: Integer;
//             begin
//                 PostCodeCheck.VerifyCity(Rec.FieldNo("Registered City"), Database::"Stagging - Cust/Vend", Rec.GetPosition(), 0,
//         Rec.Name, Rec."Name 2", Rec.Contact, Rec."Registered Address", Rec."Registered Address 2", Rec."Registered City", Rec."Registered Post Code", Rec."Registered County", Rec."Registered Country/Region Code");
//             end;
//         }
//         field(16; "Registered County"; Text[30])
//         {
//             CaptionClass = '5,1,' + "Registered Country/Region Code";
//             Caption = 'County';
//         }
//         field(17; "Registered Post Code"; Code[20])
//         {
//             Caption = 'Post Code';
//             TableRelation = IF ("Registered Country/Region Code" = CONST('')) "Post Code"
//             ELSE
//             IF ("Registered Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Registered Country/Region Code"));
//             ValidateTableRelation = false;

//             trigger OnLookup()
//             begin
//                 PostCode.LookupPostCode("Registered City", "Registered Post Code", "Registered County", "Registered Country/Region Code");
//             end;

//             trigger OnValidate()
//             var
//                 myInt: Integer;
//             begin
//                 PostCodeCheck.VerifyPostCode(Rec.FieldNo(City), Database::"Stagging - Cust/Vend", Rec.GetPosition(), 0,
//         Rec.Name, Rec."Name 2", Rec.Contact, Rec."Registered Address", Rec."Registered Address 2", Rec."Registered City", Rec."Registered Post Code", Rec."Registered County", Rec."Registered Country/Region Code");
//             end;
//         }
//         field(18; Address; Text[100])
//         {
//             Caption = 'Address';
//         }
//         field(19; "Address 2"; Text[50])
//         {
//             Caption = 'Address 2';
//         }
//         field(20; "Country/Region Code"; Code[10])
//         {
//             Caption = 'Country/Region Code';
//             TableRelation = "Country/Region";
//         }
//         field(21; City; Text[30])
//         {
//             Caption = 'City';
//             TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code".City
//             ELSE
//             IF ("Country/Region Code" = FILTER(<> '')) "Post Code".City WHERE("Country/Region Code" = FIELD("Country/Region Code"));
//             ValidateTableRelation = false;

//             trigger OnLookup()
//             begin
//                 PostCode.LookupPostCode("City", "Post Code", "County", "Country/Region Code");
//             end;

//             trigger OnValidate()
//             var
//                 myInt: Integer;
//             begin
//                 PostCodeCheck.VerifyCity(Rec.FieldNo(City), Database::"Stagging - Cust/Vend", Rec.GetPosition(), 0,
//         Rec.Name, Rec."Name 2", Rec.Contact, Rec.Address, Rec."Address 2", Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");
//             end;
//         }
//         field(22; County; Text[30])
//         {
//             CaptionClass = '5,1,' + "Country/Region Code";
//             Caption = 'County';
//         }
//         field(23; "Post Code"; Code[20])
//         {
//             Caption = 'Post Code';
//             TableRelation = IF ("Country/Region Code" = CONST('')) "Post Code"
//             ELSE
//             IF ("Country/Region Code" = FILTER(<> '')) "Post Code" WHERE("Country/Region Code" = FIELD("Country/Region Code"));
//             ValidateTableRelation = false;

//             trigger OnLookup()
//             begin
//                 PostCode.LookupPostCode("City", "Post Code", "County", "Country/Region Code");
//             end;

//             trigger OnValidate()
//             var
//                 myInt: Integer;
//             begin
//                 PostCodeCheck.VerifyPostCode(Rec.FieldNo(City), Database::"Stagging - Cust/Vend", Rec.GetPosition(), 0,
//         Rec.Name, Rec."Name 2", Rec.Contact, Rec.Address, Rec."Address 2", Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");
//             end;
//         }
//         field(24; "E-mail"; Text[80])
//         {
//             Caption = 'E-mail';
//         }
//         field(25; "Cust/Vend Created"; Boolean)
//         {
//             Caption = 'Cust/Vend Created';
//         }
//         field(26; Contact; Text[100])
//         {
//             Caption = 'Contact';

//             trigger OnLookup()
//             begin
//                 StaggingLookupContactList();
//             end;
//         }
//         field(27; "Name 2"; Text[50])
//         {
//             Caption = 'Name 2';
//         }
//         field(28; "Primary Contact No."; Code[20])
//         {
//             Caption = 'Primary Contact No.';
//             TableRelation = Contact;

//             trigger OnLookup()
//             begin
//                 StaggingLookupContactList();
//             end;
//         }
//         field(29; "Gen. Bus. Posting Group"; Code[20])
//         {
//             Caption = 'Gen. Bus. Posting Group';
//             TableRelation = "Gen. Business Posting Group";
//         }
//         field(30; "Posting Group"; Code[20])
//         {
//             Caption = 'Posting Group';
//             TableRelation = IF (Type = const(Customer)) "Customer Posting Group"
//             ELSE
//             "Vendor Posting Group";
//         }
//         field(32; "Payment Terms Code"; Code[10])
//         {
//             Caption = 'Payment Terms Code';
//             TableRelation = "Payment Terms";
//         }
//     }
//     keys
//     {
//         key(PK; "Entry No.")
//         {
//             Clustered = true;
//         }
//         key(SK; "No.", Name, Status, Type, ABN, ACN)
//         {

//         }
//     }

//     trigger OnDelete()
//     var
//         ErrorMessage: Record "Error Message";
//     begin
//         ErrorMessage.SetContext(Rec);
//         ErrorMessage.ClearLog();
//     end;

//     procedure HasErrors(var Rec: Record "Stagging - Cust/Vend"): Boolean
//     var
//         ErrorMessage: Record "Error Message";
//     begin
//         ErrorMessage.SetContext(Rec);
//         exit(ErrorMessage.HasErrors(false))
//     end;

//     procedure ValidateCustRecord(Rec: Record "Stagging - Cust/Vend"): Boolean
//     var
//         Customer_LRec: Record Customer;
//     begin
//         DeleteLineErrors();

//         Customer_LRec.Validate(ABN, Rec.ABN);
//         Customer_LRec.Validate("IRD No.", Rec.ACN);
//         Customer_LRec.Validate(Name, Rec.Name);
//         Customer_LRec.Validate(Contact, Rec.Contact);
//         Customer_LRec.Validate("Primary Contact No.", Rec."Primary Contact No.");
//         Customer_LRec.Validate("Phone No.", Rec."Phone No.");
//         Customer_LRec.Validate("E-Mail", Rec."E-mail");
//         Customer_LRec.Validate("Country/Region Code", Rec."Country/Region Code");
//         Customer_LRec.Validate("Reg_Country/Region Code", Rec."Registered Country/Region Code");
//         Customer_LRec.Validate("Gen. Bus. Posting Group", Rec."Gen. Bus. Posting Group");
//         Customer_LRec.Validate("Customer Posting Group", Rec."Posting Group");
//         Customer_LRec.Validate("Payment Terms Code", Rec."Payment Terms Code");

//         Customer_LRec.Validate("City", Rec."City");
//         Customer_LRec.Validate("Post Code", Rec."Post Code");

//         Customer_LRec.Validate("Reg_City", Rec."Registered City");
//         Customer_LRec.Validate("Reg_Post Code", Rec."Registered Post Code");

//         if PopulateErrorMessages() then
//             exit(true);
//     end;

//     procedure ValidateVendRecord(Rec: Record "Stagging - Cust/Vend"): Boolean
//     var
//         Vendor_LRec: Record Vendor;
//     begin
//         DeleteLineErrors();

//         Vendor_LRec.Validate(ABN, Rec.ABN);
//         Vendor_LRec.Validate("IRD No.", Rec.ACN);
//         Vendor_LRec.Validate(Name, Rec.Name);
//         Vendor_LRec.Validate(Contact, Rec.Contact);
//         Vendor_LRec.Validate("Primary Contact No.", Rec."Primary Contact No.");
//         Vendor_LRec.Validate("Phone No.", Rec."Phone No.");
//         Vendor_LRec.Validate("E-Mail", Rec."E-mail");
//         Vendor_LRec.Validate("Country/Region Code", Rec."Country/Region Code");
//         Vendor_LRec.Validate("Gen. Bus. Posting Group", Rec."Gen. Bus. Posting Group");
//         Vendor_LRec.Validate("Vendor Posting Group", Rec."Posting Group");
//         Vendor_LRec.Validate("Payment Terms Code", Rec."Payment Terms Code");
//         Vendor_LRec.Validate("City", Rec."City");
//         Vendor_LRec.Validate("Post Code", Rec."Post Code");
//         Vendor_LRec.Validate("Reg_Country/Region Code", Rec."Registered Country/Region Code");
//         Vendor_LRec.Validate("Reg_City", Rec."Registered City");
//         Vendor_LRec.Validate("Reg_Post Code", Rec."Registered Post Code");
//         PostCodeCheck.VerifyCity(Rec.FieldNo(City), Database::"Stagging - Cust/Vend", Rec.GetPosition(), 0,
//         Rec.Name, Rec."Name 2", Rec.Contact, Rec.Address, Rec."Address 2", Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");
//         PostCodeCheck.VerifyPostCode(Rec.FieldNo(City), Database::"Stagging - Cust/Vend", Rec.GetPosition(), 0,
//         Rec.Name, Rec."Name 2", Rec.Contact, Rec.Address, Rec."Address 2", Rec.City, Rec."Post Code", Rec.County, Rec."Country/Region Code");

//         if PopulateErrorMessages() then
//             exit(true);
//     end;

//     procedure ModifyCustomerRecord(var StaggingCust: Record "Stagging - Cust/Vend")
//     var
//         Customer_LRec: Record Customer;
//         ModifyNeeded: Boolean;
//     begin
//         Customer_LRec.Reset();
//         Customer_LRec.SetRange(ABN, Rec.ABN);
//         Customer_LRec.SetRange("IRD No.", Rec.ACN);

//         Customer_LRec.FindFirst();

//         if StaggingCust."No." <> Customer_LRec."No." then begin
//             Customer_LRec.Validate("No.", StaggingCust."No.");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.Name <> Customer_LRec.Name then begin
//             Customer_LRec.Validate(Name, StaggingCust.Name);
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Phone No." <> Customer_LRec."Phone No." then begin
//             Customer_LRec.Validate("Phone No.", StaggingCust."Phone No.");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."E-mail" <> Customer_LRec."E-mail" then begin
//             Customer_LRec.Validate("E-mail", StaggingCust."E-mail");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Business Type" <> Customer_LRec."Business Type" then begin
//             Customer_LRec.Validate("Business Type", StaggingCust."Business Type");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Reference No." <> Customer_LRec."Reference No." then begin
//             Customer_LRec.Validate("Reference No.", StaggingCust."Reference No.");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.Address <> Customer_LRec.Address then begin
//             Customer_LRec.Address := StaggingCust.Address;
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Address 2" <> Customer_LRec."Address 2" then begin
//             Customer_LRec."Address 2" := StaggingCust."Address 2";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Country/Region Code" <> Customer_LRec."Country/Region Code" then begin
//             Customer_LRec.Validate("Country/Region Code", StaggingCust."Country/Region Code");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.City <> Customer_LRec.City then begin
//             Customer_LRec.Validate(City, StaggingCust.City);
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.County <> Customer_LRec.County then begin
//             Customer_LRec.County := StaggingCust.County;
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Post Code" <> Customer_LRec."Post Code" then begin
//             Customer_LRec.Validate("Post Code", StaggingCust."Post Code");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Address" <> Customer_LRec."Reg_Address" then begin
//             Customer_LRec."Reg_Address" := StaggingCust."Registered Address";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Address 2" <> Customer_LRec."Reg_Address 2" then begin
//             Customer_LRec."Reg_Address 2" := StaggingCust."Registered Address 2";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Country/Region Code" <> Customer_LRec."Reg_Country/Region Code" then begin
//             Customer_LRec."Reg_Country/Region Code" := StaggingCust."Registered Country/Region Code";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered City" <> Customer_LRec."Reg_City" then begin
//             Customer_LRec."Reg_City" := StaggingCust."Registered City";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered County" <> Customer_LRec."Reg_County" then begin
//             Customer_LRec."Reg_County" := StaggingCust."Registered County";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Post Code" <> Customer_LRec."Reg_Post Code" then begin
//             Customer_LRec."Reg_Post Code" := StaggingCust."Registered Post Code";
//             ModifyNeeded := true;
//         end;
//         if StaggingCust."Gen. Bus. Posting Group" <> Customer_LRec."Gen. Bus. Posting Group" then begin
//             Customer_LRec."Reg_Post Code" := StaggingCust."Gen. Bus. Posting Group";
//             ModifyNeeded := true;
//         end;
//         if StaggingCust."Posting Group" <> Customer_LRec."Customer Posting Group" then begin
//             Customer_LRec."Reg_Post Code" := StaggingCust."Posting Group";
//             ModifyNeeded := true;
//         end;
//         if StaggingCust."Payment Terms Code" <> Customer_LRec."Payment Terms Code" then begin
//             Customer_LRec."Reg_Post Code" := StaggingCust."Payment Terms Code";
//             ModifyNeeded := true;
//         end;

//         if ModifyNeeded then Customer_LRec.Modify(true);
//     end;

//     procedure CreateCustomerRecord(var Rec: Record "Stagging - Cust/Vend")
//     var
//         Customer_LRec: Record Customer;
//         SalesSetup: Record "Sales & Receivables Setup";
//         NoSeriesMgnt: Codeunit NoSeriesManagement;
//     begin
//         Customer_LRec.Init();
//         SalesSetup.Get();

//         if Rec."No." <> '' then
//             Customer_LRec."No." := Rec."No."
//         else
//             Customer_LRec."No." := NoSeriesMgnt.GetNextNo(SalesSetup."Customer Nos.", Today, true);

//         Customer_LRec.Validate(ABN, Rec.ABN);
//         Customer_LRec."IRD No." := Rec.ACN;
//         Customer_LRec.Validate(Name, Rec.Name);
//         Customer_LRec.Validate("Phone No.", Rec."Phone No.");
//         Customer_LRec.Validate("E-Mail", Rec."E-mail");
//         Customer_LRec."Business Type" := Rec."Business Type";
//         Customer_LRec.Status := Rec.Status;
//         Customer_LRec."Reference No." := Rec."Reference No.";

//         Customer_LRec.Address := Rec.Address;
//         Customer_LRec."Address 2" := Rec."Address 2";
//         Customer_LRec.Validate("Country/Region Code", Rec."Country/Region Code");
//         Customer_LRec.Validate("City", Rec."City");
//         Customer_LRec.Validate("Post Code", Rec."Post Code");
//         Customer_LRec.County := Rec.County;

//         Customer_LRec.Reg_Address := Rec."Registered Address";
//         Customer_LRec."Reg_Address 2" := Rec."Registered Address 2";
//         Customer_LRec.Validate("Reg_Country/Region Code", Rec."Registered Country/Region Code");
//         Customer_LRec.Validate("Reg_City", Rec."Registered City");
//         Customer_LRec.Validate("Reg_Post Code", Rec."Registered Post Code");
//         Customer_LRec.Reg_County := Rec."Registered County";

//         Customer_LRec.Validate("Gen. Bus. Posting Group", Rec."Gen. Bus. Posting Group");
//         Customer_LRec."Customer Posting Group" := Rec."Posting Group";
//         Customer_LRec.Validate("Payment Terms Code", Rec."Payment Terms Code");

//         Customer_LRec.Insert(true);
//         Rec."Cust/Vend Created" := true;

//         if Confirm('Customer %1 created successfully\\Do you want to open it?', false, Rec."No.") then
//             Page.Run(Page::"Customer Card", Customer_LRec);
//     end;

//     procedure ModifyVendorRecord(var StaggingCust: Record "Stagging - Cust/Vend")
//     var
//         Vendor_LRec: Record Vendor;
//         ModifyNeeded: Boolean;
//     begin
//         Vendor_LRec.Reset();
//         Vendor_LRec.SetRange(ABN, Rec.ABN);
//         Vendor_LRec.SetRange("IRD No.", Rec.ACN);

//         Vendor_LRec.FindFirst();

//         if StaggingCust."No." <> Vendor_LRec."No." then begin
//             Vendor_LRec.Validate("No.", StaggingCust."No.");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.Name <> Vendor_LRec.Name then begin
//             Vendor_LRec.Validate(Name, StaggingCust.Name);
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Phone No." <> Vendor_LRec."Phone No." then begin
//             Vendor_LRec.Validate("Phone No.", StaggingCust."Phone No.");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."E-mail" <> Vendor_LRec."E-mail" then begin
//             Vendor_LRec.Validate("E-mail", StaggingCust."E-mail");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Business Type" <> Vendor_LRec."Business Type" then begin
//             Vendor_LRec.Validate("Business Type", StaggingCust."Business Type");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Reference No." <> Vendor_LRec."Reference No." then begin
//             Vendor_LRec.Validate("Reference No.", StaggingCust."Reference No.");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.Address <> Vendor_LRec.Address then begin
//             Vendor_LRec.Address := StaggingCust.Address;
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Address 2" <> Vendor_LRec."Address 2" then begin
//             Vendor_LRec."Address 2" := StaggingCust."Address 2";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Country/Region Code" <> Vendor_LRec."Country/Region Code" then begin
//             Vendor_LRec.Validate("Country/Region Code", StaggingCust."Country/Region Code");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.City <> Vendor_LRec.City then begin
//             Vendor_LRec.Validate(City, StaggingCust.City);
//             ModifyNeeded := true;
//         end;

//         if StaggingCust.County <> Vendor_LRec.County then begin
//             Vendor_LRec.County := StaggingCust.County;
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Post Code" <> Vendor_LRec."Post Code" then begin
//             Vendor_LRec.Validate("Post Code", StaggingCust."Post Code");
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Address" <> Vendor_LRec."Reg_Address" then begin
//             Vendor_LRec."Reg_Address" := StaggingCust."Registered Address";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Address 2" <> Vendor_LRec."Reg_Address 2" then begin
//             Vendor_LRec."Reg_Address 2" := StaggingCust."Registered Address 2";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Country/Region Code" <> Vendor_LRec."Reg_Country/Region Code" then begin
//             Vendor_LRec."Reg_Country/Region Code" := StaggingCust."Registered Country/Region Code";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered City" <> Vendor_LRec."Reg_City" then begin
//             Vendor_LRec."Reg_City" := StaggingCust."Registered City";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered County" <> Vendor_LRec."Reg_County" then begin
//             Vendor_LRec."Reg_County" := StaggingCust."Registered County";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Registered Post Code" <> Vendor_LRec."Reg_Post Code" then begin
//             Vendor_LRec."Reg_Post Code" := StaggingCust."Registered Post Code";
//             ModifyNeeded := true;
//         end;

//         if StaggingCust."Gen. Bus. Posting Group" <> Vendor_LRec."Gen. Bus. Posting Group" then begin
//             Vendor_LRec."Reg_Post Code" := StaggingCust."Gen. Bus. Posting Group";
//             ModifyNeeded := true;
//         end;
//         if StaggingCust."Posting Group" <> Vendor_LRec."Vendor Posting Group" then begin
//             Vendor_LRec."Reg_Post Code" := StaggingCust."Posting Group";
//             ModifyNeeded := true;
//         end;
//         if StaggingCust."Payment Terms Code" <> Vendor_LRec."Payment Terms Code" then begin
//             Vendor_LRec."Reg_Post Code" := StaggingCust."Payment Terms Code";
//             ModifyNeeded := true;
//         end;

//         if ModifyNeeded then Vendor_LRec.Modify(true);
//     end;

//     procedure CreateVendorRecord(var Rec: Record "Stagging - Cust/Vend")
//     var
//         Vendor_LRec: Record Vendor;
//         VendSetup: Record "Purchases & Payables Setup";
//         NoSeriesMgnt: Codeunit NoSeriesManagement;
//     begin
//         Vendor_LRec.Init();
//         VendSetup.Get();

//         if Rec."No." <> '' then
//             Vendor_LRec."No." := Rec."No."
//         else
//             Vendor_LRec."No." := NoSeriesMgnt.GetNextNo(VendSetup."Vendor Nos.", Today, true);

//         Vendor_LRec.Validate(ABN, Rec.ABN);
//         Vendor_LRec."IRD No." := Rec.ACN;
//         Vendor_LRec.Validate(Name, Rec.Name);
//         Vendor_LRec.Validate("Phone No.", Rec."Phone No.");
//         Vendor_LRec.Validate("E-Mail", Rec."E-mail");
//         Vendor_LRec."Business Type" := Rec."Business Type";
//         Vendor_LRec.Status := Rec.Status;
//         Vendor_LRec."Reference No." := Rec."Reference No.";

//         Vendor_LRec.Address := Rec.Address;
//         Vendor_LRec."Address 2" := Rec."Address 2";
//         Vendor_LRec.Validate("Country/Region Code", Rec."Country/Region Code");
//         Vendor_LRec.Validate("City", Rec."City");
//         Vendor_LRec.Validate("Post Code", Rec."Post Code");
//         Vendor_LRec.County := Rec.County;

//         Vendor_LRec.Reg_Address := Rec."Registered Address";
//         Vendor_LRec."Reg_Address 2" := Rec."Registered Address 2";
//         Vendor_LRec.Validate("Reg_Country/Region Code", Rec."Registered Country/Region Code");
//         Vendor_LRec.Validate("Reg_City", Rec."Registered City");
//         Vendor_LRec.Validate("Reg_Post Code", Rec."Registered Post Code");
//         Vendor_LRec.Reg_County := Rec."Registered County";

//         Vendor_LRec.Validate("Gen. Bus. Posting Group", Rec."Gen. Bus. Posting Group");
//         Vendor_LRec."Vendor Posting Group" := Rec."Posting Group";
//         Vendor_LRec.Validate("Payment Terms Code", Rec."Payment Terms Code");

//         Vendor_LRec.Insert(true);
//         Rec."Cust/Vend Created" := true;

//         if Confirm('Vendor %1 created successfully\\Do you want to open it?', false, Rec."No.") then
//             Page.Run(Page::"Vendor Card", Vendor_LRec);
//     end;

//     local procedure DeleteLineErrors()
//     var
//         ErrorMessage: Record "Error Message";
//     begin
//         ErrorMessage.SetContext(Rec);
//         ErrorMessage.ClearLog();
//     end;

//     local procedure PopulateErrorMessages(): Boolean
//     var
//         ErrorMessage: Record "Error Message";
//     begin
//         ErrorMessage.SetContext(Rec);

//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo(ABN), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo(ACN), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo("No."), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo(Name), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo(Address), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo("Address 2"), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo("Gen. Bus. Posting Group"), ErrorMessage."Message Type"::Error);
//         ErrorMessage.LogIfEmpty(Rec, Rec.FieldNo("Posting Group"), ErrorMessage."Message Type"::Error);
//         if ErrorMessage.HasErrors(false) then
        
//             exit(true);
//     end;

//     local procedure StaggingLookupContactList()
//     var
//         ContactBusinessRelation: Record "Contact Business Relation";
//         Cont: Record Contact;
//         TempStagging: Record "Stagging - Cust/Vend" temporary;
//     begin
//         Cont.FilterGroup(2);
//         if ContactBusinessRelation.FindByRelation(ContactBusinessRelation."Link to Table"::Customer, "No.") then
//             Cont.SetRange("Company No.", ContactBusinessRelation."Contact No.")
//         else
//             Cont.SetRange("Company No.", '');

//         if "Primary Contact No." <> '' then
//             if Cont.Get("Primary Contact No.") then;
//         if PAGE.RunModal(0, Cont) = ACTION::LookupOK then begin
//             TempStagging.Copy(Rec);
//             Find();
//             TransferFields(TempStagging, false);
//             Validate("Primary Contact No.", Cont."No.");
//         end;
//     end;

//     var
//         PostCode: Record "Post Code";
//         PostCodeCheck: Codeunit "Post Code Check";
// }
