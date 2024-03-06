table 50170 "Stagging Customers/Vendors"
{
    Caption = 'Stagging Customers/Vendors';
    DataClassification = ToBeClassified;
    DataCaptionFields = Type, ABN;

    fields
    {

        field(1; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = ,Customer,Vendor;
        }
        field(2; ABN; Integer)
        {
            Caption = 'ABN';

        }
        field(3; "ABN Divison Part No."; Integer)
        {
            Caption = 'ABN Divison Part No.';
        }
        field(4; ACN; Integer)
        {
            Caption = 'ACN';

        }
        field(5; "No."; Code[10])
        {
            Caption = 'No.';

        }
        field(6; Name; Text[25])
        {
            Caption = 'Name';

        }
        field(7; "Phone No."; Text[10])
        {
            Caption = 'Phone No.';
            Numeric = true;
        }
        field(8; "E-mail"; Text[50])
        {
            Caption = 'E-mail';

        }
        field(9; "Business Type"; Enum "Business Type")
        {
            Caption = 'Business Type';
        }
        field(10; Status; Option)
        {
            Caption = 'Status';
            OptionMembers = ,Registered,Pending;
        }
        field(11; "Reference No."; Integer)
        {
            Caption = 'Reference No.';
        }
        field(12; Address; Text[50])
        {
            Caption = 'Address';

        }
        field(13; "Address 2"; Text[50])
        {
            Caption = 'Address 2';

        }
        field(14; "Country/Region Code"; Text[25])
        {
            Caption = 'Country/Region Code';
        }
        field(15; City; Text[25])
        {
            Caption = 'City';
        }
        field(16; R_Address; Text[50])
        {
            Caption = 'Address';

        }
        field(17; "R_Address 2"; Text[50])
        {
            Caption = 'Address 2';

        }
        field(18; "R_Country/Region Code"; Text[25])
        {
            Caption = 'Country/Region Code';
        }
        field(19; R_City; Text[25])
        {
            Caption = 'City';
        }
        field(20; ID; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }

    var
        // EmpID: Text[30];
        regex: Codeunit Regex;
        Pattern: Text;
        email: Text[70];

}
