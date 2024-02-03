table 50120 Enrollment
{
    Caption = 'Enrollment';
    DataClassification = ToBeClassified;
    LookupPageId = "Enrollment Page";
    
    fields
    {
        field(1; "Enrollment No."; Integer)
        {
            Caption = 'First Name';
        }
        field(2; "First Name"; Text[20])
        {
            Caption = 'First Name';
        }
        field(3; "Last Name"; Text[20])
        {
            Caption = 'Last Name';
        }
        field(4; "Profile Photo"; Blob)
        {
            Caption = 'Profile Photo';
            Subtype = Bitmap;
        }
    }
    keys
    {
        key(PK; "Enrollment No.")
        {
            Clustered = true;
        }
    }
}
