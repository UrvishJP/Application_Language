table 50110 DemoTable
{
    Caption = 'DemoTable';
    DataClassification = ToBeClassified;

    // DataPerCompany = false;
    // PasteIsValid = false;


    fields
    {
        field(1; Urvish; Text[20])
        {
            Caption = 'Urvish';

            // Access = Local;
            // Access = Protected;
            // Access = Internal;
            // Access = Public;


            // CaptionClass = '1,QuantumQuad Solutions LLP';
            // CaptionClass = '2,0,QuantumQuad Solutions LLP';
            // CaptionClass = '2,1,QuantumQuad Solutions LLP';
            // CaptionClass = '3,QuantumQuad Solutions LLP';

        }
        field(2; Devam; Text[20])
        {
            // Enabled = false;
            Caption = 'Devam';
        }

        field(3; Yash; Text[20])
        {
            Caption = 'Yash';
        }
    }
    keys
    {
        key(PK; Urvish)
        {
            Clustered = true;
        }
    }

    trigger OnDelete()

    begin
        Message('Deleted');
    end;
    trigger OnInsert()

    begin
        Message('Inserted');
    end;
    trigger OnModify()

    begin
        Message('Modified');
    end;
    trigger OnRename()

    begin
        Message('Renamed');
    end;
}
