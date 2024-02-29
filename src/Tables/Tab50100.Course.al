table 50100 Course
{
    DataClassification = ToBeClassified;
    // LookupPageId = "DemoPage";
    DrillDownPageId = "DemoPage";

 



    fields
    {
        field(10; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            

        }
        field(20; Name; Text[50])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()

            begin
                Message('Look Up triggered');
            end;

        }
        field(30; Description; Text[50])
        {
            DataClassification = ToBeClassified;

        }
        field(40; Type; Option)
        {
            OptionMembers = "Instructor Led","e-Learning","Remote Training";
            DataClassification = ToBeClassified;

        }
        field(50; Duration; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(60; Price; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(70; Active; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(80; Difficulty; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(90; "Passing Rate"; Integer)
        {
            DataClassification = ToBeClassified;

        }
        field(100; "Instructor Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = DemoTable;

        }
        field(120; "Instructor Name"; Text[100])
        {
            // Editable = false;
            FieldClass = FlowField;
            CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD("Instructor Code")));
        }
    }

    keys
    {
        key(pk; Code)
        {
            Clustered = true;
        }
        key(sk1; "Instructor Code")
        {

        }
        key(sk2; Type)
        {

        }
    }

}

