table 50121 Country
{
    Caption = 'Country';
    DataClassification = ToBeClassified;
    LookupPageId = CountryPage;
    fields
    {
        field(1; Country; Text[20])
        {
            Caption = 'Country';
        }
        field(2; State; Text[20])
        {
            Caption = 'State';
        }
        field(3; City; Text[20])
        {
            Caption = 'City';
        }
    }
    keys
    {
        key(PK; Country)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(Dropdown; Country, State)
        {

        }
    }
}
