table 50118 "Student Information"
{
    Caption = 'Student Information';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Personal Info";



    fields
    {
        field(1; "Enrollment No."; Integer)
        {
            Caption = 'Enrollment No.';
            


        }
        field(2; Name; Text[20])
        {
            Caption = 'Name';
            // ExtendedDatatype = URL;

        }
        field(3; Country; Text[20])
        {
            Caption = 'Country';
            TableRelation = Country;


        }
        field(4; "Phone no."; Text[20])
        {
            Caption = 'Phone no.';
            CharAllowed = 'ADWZ';
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
            // AutoFormatType = 10;
            // AutoFormatExpression = '1, USD';

            // BlankNumbers = DontBlank;



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
            CalcFormula = average("Student Information"."Fees per term" where(Name = field(Name)));
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
