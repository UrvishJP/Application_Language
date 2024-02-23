table 50110 DemoTable
{
    Caption = 'DemoTable';
    DataClassification = ToBeClassified;
    LookupPageId = DemoPage;



    // DataPerCompany = false;
    // PasteIsValid = false;
    // InherentEntitlements =
    // InherentPermissions =
    // Permissions = tabledata "AAD Application" = 


    fields
    {
        field(1; Urvish; Text[20])
        {
            Caption = 'Urvish';
            DataClassification = ToBeClassified;

            trigger OnValidate()

            begin
                // if StrLen(Urvish) < 2 then 
                //     Error('Hello');
                Message('OnValidate');
                                              
            end;

            trigger OnLookup()
            var
            v : Record "Student Information";
            begin
                begin
                    Page.RunModal(Page::"Student Info Page")
                        // Message('OnLookup');
                        // Rec.Urvish:= v.Name;
                        // Validate(Urvish,Urvish);
                        
                end;
            end;


            // Access = Local;
            // Access = Protected;
            // Access = Internal;
            // Access = Public;
            // AccessByPermission = X;
            // AllowInCustomizations =
            // Editable = false;
            





            // CaptionClass = '1,QuantumQuad Solutions LLP';
            // CaptionClass = '2,0,QuantumQuad Solutions LLP';
            // CaptionClass = '2,1,QuantumQuad Solutions LLP';
            // CaptionClass = '3,QuantumQuad Solutions LLP';
            // trigger OnLookup()


            // begin
            //     Page.RunModal(Page::"Student Info Page");
            //     Message('lookup');
            // end;

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


    // trigger OnDelete()

    // begin
    //     Message('Deleted');
    // end;

    // trigger OnInsert()

    // begin
    //     Message('Inserted');
    // end;

    // trigger OnModify()

    // begin
    //     Message('Modified');
    // end;

    // trigger OnRename()

    // begin
    //     Message('Renamed');
    // end;
}
