table 50118 "Student Information"
{
    Caption = 'Student Information';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Enrollment No."; Integer)
        {
            Caption = 'Enrollment No.';
            TableRelation = Enrollment;

        }
        field(2; Name; Text[20])
        {
            Caption = 'Name';
        }
        field(3; Country; Code[20])
        {
            Caption = 'Country';


        }
        field(4; "Phone no."; Text[20])
        {
            Caption = 'Phone no.';
        }
        field(5; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = Select,Male,Female,"Prefer Not to Say";
        }
        field(6; "Physically Disabled"; Boolean)
        {
            Caption = 'Physically Disabled';
        }
        field(7; "Term start date"; Date)
        {
            Caption = 'Term start date';
        }
        field(9; "Fav Activity"; Enum "Fav Activity")
        {
            Caption = 'Fav Activity';
        }
        field(10; "Fees per term"; Decimal)
        {
            Caption = 'Fees per term';



            DecimalPlaces = 0 : 5;
            trigger OnValidate()

            // "Fees per term" := Rec."Fees per term";
            begin
                "Fees per term" := System.Round("Fees per term", 0.01, '=');
            end;

        }
        field(11; avg; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = average("Student Information"."Fees per term" where (Name = field(Name)));
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
