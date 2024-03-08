page 50171 "Stagging - Cust/Vend"
{
    ApplicationArea = All;
    Caption = 'Stagging - Cust/Vend';
    PageType = Card;
    SourceTable = "Stagging Customers/Vendors";
    UsageCategory = Lists;
    DataCaptionFields = Type, ABN;

    layout
    {
        area(content)
        {

            field(Type; Rec.Type)
            {
                ToolTip = 'Specifies the value of the Type field.';

            }
            field(ABN; Rec.ABN)
            {
                ToolTip = 'Specifies the value of the ABN field.';
            }
            field("ABN Divison Part No."; Rec."ABN Divison Part No.")
            {
                ToolTip = 'Specifies the value of the ABN Divison Part No. field.';
            }
            field(ACN; Rec.ACN)
            {
                ToolTip = 'Specifies the value of the ACN field.';
            }

            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ShowMandatory = true;

                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';

                    trigger OnValidate()

                    begin
                        if (StrLen(Rec."Phone No.") <> 10) then
                            Error('Phone No. must be of 10 digits only.');
                    end;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ToolTip = 'Specifies the value of the E-mail field.';

                }
                field("Business Type"; Rec."Business Type")
                {
                    ToolTip = 'Specifies the value of the Business Type field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';


                }
                field("Reference No."; Rec."Reference No.")
                {
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }

            }
            group(Address)
            {
                group(Address1)
                {
                    Caption = 'Address';
                    field("Address 1"; Rec.Address)
                    {
                        ToolTip = 'Specifies the value of the Address field.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ToolTip = 'Specifies the value of the Address 2 field.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ToolTip = 'Specifies the value of the Country/Region Code field.';
                    }
                    field(City; Rec.City)
                    {
                        ToolTip = 'Specifies the value of the City field.';
                    }
                }

                group("Registered Address")
                {
                    field(R_Address; Rec.R_Address)
                    {
                        ToolTip = 'Specifies the value of the Address field.';
                    }
                    field("R_Address 2"; Rec."R_Address 2")
                    {
                        ToolTip = 'Specifies the value of the Address 2 field.';
                    }
                    field("R_Country/Region Code"; Rec."R_Country/Region Code")
                    {
                        ToolTip = 'Specifies the value of the Country/Region Code field.';
                    }
                    field(R_City; Rec.R_City)
                    {
                        ToolTip = 'Specifies the value of the City field.';
                    }
                }

            }

        }
        area(FactBoxes)
        {
            part("Error Factbox"; "Error Factbox")
            {
                ApplicationArea = all;
            }
        }

    }


    actions
    {
        area(Promoted)
        {
            actionref(MyPromotedActionRef; Validate)
            {

            }

            actionref(MyPromotedActionRef2; "Create Customer")
            {


            }
            actionref(MyPromotedActionRef3; "Create Vendor")
            {

            }



        }
        area(Processing)
        {

            action(Validate)
            {
                ApplicationArea = All;
                Image = ViewCheck;
                Enabled = Rec.Status = Rec.Status::Registered;

                trigger OnAction()

                begin
                    ErrorMsg.DeleteAll();
                    ErrorFact.ValidateFields(Rec);
                end;


            }

            action("Create Customer")
            {
                ApplicationArea = All;
                Image = PersonInCharge;
                Visible = Rec.Type = Rec.Type::Customer;
                Enabled = Rec.Status = Rec.Status::Registered;

                trigger OnAction()
                var
                    Cust_Rec: Record Customer;

                begin

                    ErrorMsg.DeleteAll();

                    if (NOT ErrorFact.ValidateFields(Rec)) then begin

                        if Confirm('Do you want to create a new Customer for this record?') then begin

                            Clear(Cust_Rec);
                            Cust_Rec."No." := Rec."No.";
                            Cust_Rec.Name := Rec.Name;
                            Cust_Rec.Address := Rec.Address;
                            Cust_Rec."Address 2" := Rec."Address 2";
                            Cust_Rec."Phone No." := Rec."Phone No.";
                            Cust_Rec."E-Mail" := Rec."E-mail";
                            Cust_Rec.Insert();
                            CurrPage.Close();
                            Page.Run(Page::"Customer Card", Cust_Rec);

                        end;
                    end;
                end;
            }

            action("Create Vendor")
            {
                ApplicationArea = All;
                Image = PersonInCharge;
                Visible = Rec.Type = Rec.Type::Vendor;
                Enabled = Rec.Status = Rec.Status::Registered;

                trigger OnAction()
                var
                    Vend_Rec: Record Vendor;

                begin

                    ErrorMsg.DeleteAll();

                    if (NOT ErrorFact.ValidateFields(Rec)) then begin

                        if Confirm('Do you want to create a new Vendor for this record?') then begin

                            Clear(Vend_Rec);
                            Vend_Rec."No." := Rec."No.";
                            Vend_Rec.Name := Rec.Name;
                            Vend_Rec.Address := Rec.Address;
                            Vend_Rec."Address 2" := Rec."Address 2";
                            Vend_Rec."Phone No." := Rec."Phone No.";
                            Vend_Rec."E-Mail" := Rec."E-mail";
                            Vend_Rec.Insert();
                            CurrPage.Close();
                            Page.Run(Page::"Vendor Card", Vend_Rec);

                        end;
                    end;
                end;

            }
        }
    }

    var
        ErrorFact: Codeunit "Error Factbox";
        ErrorMsg: Record "Error Message";

}
