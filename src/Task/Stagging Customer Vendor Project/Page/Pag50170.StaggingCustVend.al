page 50170 "Stagging - Cust/Vend List"
{
    ApplicationArea = All;
    Caption = 'Stagging - Cust/Vend List';
    PageType = List;
    SourceTable = "Stagging Customers/Vendors";
    UsageCategory = Lists;
    CardPageId = "Stagging - Cust/Vend";

    layout
    {
        area(content)
        {

            repeater(General)
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
                field(Address; Rec.Address)
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
