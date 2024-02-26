table 50150 Student
{
    Caption = 'Student';
    DataClassification = ToBeClassified;
    


    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            AutoIncrement = true;

        }
        field(2; Name; Text[25])
        {
            Caption = 'Name';
            
    
        }
        field(3; City; Text[25])
        {
            Caption = 'City';

            trigger OnLookup()
            var
                CityName: Record City;
            begin
                if (Page.RunModal(Page::"City List", CityName)) = Action::LookupOK then
                    Rec.City := CityName.Name;
            end;

        }
        field(4; "Total Marks"; Decimal)
        {
            Caption = 'Total Marks';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum(Stream."Total Marks" where(Type = field(Stream)));
        }
        field(5; "Obtain Marks"; Decimal)
        {
            Caption = 'Obtain Marks';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum(Result."Obtain Marks" where(ID = field(ID)));
        }
        field(6; "School Name"; Text[25])
        {
            Caption = 'School Name';

            trigger OnLookup()
            var
                SchoolName: Record School;
            begin
                if (Page.RunModal(Page::"School List", SchoolName)) = Action::LookupOK then
                    Rec."School Name" := SchoolName.Name;
            end;
        }
        field(7; Stream; Enum Stream)
        {
            Caption = 'Stream';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
    }
}
