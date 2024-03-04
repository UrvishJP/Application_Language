table 50154 Result
{
    Caption = 'Result';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'Result ID';
              trigger OnLookup()
            var
                StudentID: Record Student;
            begin
                if (Page.RunModal(Page::"Student List", StudentID)) = Action::LookupOK then
                    Rec.ID := StudentID.ID;
                    Rec.Name := StudentID.Name;
                    Rec.Stream := StudentID.Stream;
            end;
        }
        field(2; Name; Text[25])
        {
            Caption = 'Name';

        }
        field(3; Stream; Enum Stream)
        {
            Caption = 'Stream';
        }
        field(4; Subject; Text[25])
        {
            Caption = 'Subject';

            trigger OnLookup()

            var
                StreamName: Record Stream;

            begin
                StreamName.SetRange(Type, Stream);
                if (Page.RunModal(Page::"Stream List", StreamName)) = Action::LookupOK then
                    Rec.Subject := StreamName.Subject;
                Rec."Total Marks" := StreamName."Total Marks";
            end;

        }
        field(5; "Total Marks"; Decimal)
        {
            Caption = 'Total Marks';
            Editable = false;
        }
        field(6; "Obtain Marks"; Decimal)
        {
            Caption = 'Obtain Marks';
        }
    }
    keys
    {
        key(PK; ID, Stream, Subject)
        {
            Clustered = true;
        }
    }
}
