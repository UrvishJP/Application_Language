table 50200 "Purchase Order Import Table"
{
    Caption = 'Purchase Order Import Table';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Imported Vendor No."; Code[30])
        {
            Caption = 'Imported Vendor No.';
            TableRelation = Vendor;

        }
        field(2; "Imported Item No."; Code[30])
        {
            Caption = 'Imported Item No.';
            TableRelation = Item;
        }
        field(3; "Imported Location Code"; Code[30])
        {
            Caption = 'Imported Location Code';
        }
        field(4; "Imported Ship-to Country Code"; Code[30])
        {
            Caption = 'Imported Ship-to Country Code';
        }
        field(5; "Imported Shipping Agent Code"; Code[30])
        {
            Caption = 'Imported Shipping Agent Code';
        }
        field(6; "ImportedShippingAgentService"; Code[30])
        {
            Caption = 'Imported Shipping Agent Service';
        }
        field(7; "Imported External Document No."; Text[30])
        {
            Caption = 'Imported External Document No.';
        }
        field(21; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(22; "Order Date"; Date)
        {
            Caption = 'Order Date';
        }
        field(10; "Imported Shipment Date"; Date)
        {
            Caption = 'Imported Shipment Date';
        }
        field(11; "Imported Ship-to Name"; Text[30])
        {
            Caption = 'Imported Ship-to Name';
        }
        field(12; "Imported Ship-to Address"; Text[100])
        {
            Caption = 'Imported Ship-to Address';
        }
        field(13; "Imported Ship-to Address 2"; Text[100])
        {
            Caption = 'Imported Ship-to Address 2';
        }
        field(14; "Imported Ship-to City"; Text[30])
        {
            Caption = 'Imported Ship-to City';
        }
        field(15; "Imported Ship-to State"; Text[30])
        {
            Caption = 'Imported Ship-to State';
        }
        field(16; "Imported Ship-to Post Code"; Code[20])
        {
            Caption = 'Imported Ship-to Post Code';
        }
        field(17; "Imported Item Quantity"; Decimal)
        {
            Caption = 'Imported Item Quantity';
        }
        field(18; "Imported Item Unit Price"; Decimal)
        {
            Caption = 'Imported Item Unit Price';
        }
        field(19; "Imported Line Discount Amount"; Decimal)
        {
            Caption = 'Imported Line Discount Amount';
        }
        field(20; "Vendor No."; Text[30])
        {
            Caption = 'Vendor No.';
        }
        field(23; "Shipping Agent Code"; Code[20])
        {
            Caption = 'Shipping Agent Code';
        }
        field(24; "Shipping Agent Service"; Code[20])
        {
            Caption = 'Shipping Agent Service';
        }
        field(25; "Batch Name"; Text[50])
        {
            trigger OnLookup()
            var
                ImpBatch: Record "Purchase Order Import Batches";
            begin
                if Page.RunModal(Page::"Purchase Order Import Batches", ImpBatch) = Action::LookupOK then
                    "Batch Name" := ImpBatch.Name;
            end;
        }
        field(26; "Line No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK; "Line No", "Batch Name")
        {
            Clustered = true;
        }
    }

}
