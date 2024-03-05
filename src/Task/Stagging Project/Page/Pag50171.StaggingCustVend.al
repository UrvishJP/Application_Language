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
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the value of the Phone No. field.';
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
            // group(Condition)
            // {

            // }
            action(Validate)
            {
                ApplicationArea = All;
                Image = ViewCheck;



                trigger OnAction()
                var
                    myInt: Integer;
                begin

                end;
            }

            action("Create Customer")
            {
                ApplicationArea = All;
                Image = PersonInCharge;
                Visible = Rec.Type = Rec.Type::Customer;
                trigger OnAction()
                var
                    myInt: Integer;
                begin



                end;

            }
            action("Create Vendor")
            {
                ApplicationArea = All;
                Image = PersonInCharge;
                Visible = Rec.Type = Rec.Type::Vendor;

                trigger OnAction()
                var
                    myInt: Integer;
                begin

                end;
            }
        }
    }

}
