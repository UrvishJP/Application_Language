table 50115 Employeee
{
    Caption = 'Employeee';
    DataClassification = ToBeClassified;
    DataPerCompany = true;
    // The DataPerCompany property is set to true, indicating that data will be stored separately for each company.


    PasteIsValid = false;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = Customer;
        }
        field(2; DOB; Decimal)
        {
            Caption = 'DOB';
            FieldClass = FlowField;
            CalcFormula = average("Cust. Ledger Entry"."Sales (LCY)" where("Customer No." = field("No.")));
        }
        field(3; Salary; Decimal)
        {
            Caption = 'Salary';
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Sales (LCY)" where("Customer No." = field("No.")));
        }
        field(4; Hobby; Integer)
        {
            Caption = 'Hobby';
            FieldClass = FlowField;
            CalcFormula = count("Cust. Ledger Entry" where("Customer No." = FIELD("No.") , "Sales (LCY)" = filter(>50)));
        }
        field(5; Experience; Boolean)
        {
            Caption = 'Experience';
            FieldClass = FlowField;
            CalcFormula = exist("Cust. Ledger Entry" where("Customer No." = FIELD("No.")));
        }
        field(6; "Dept."; Code[20])
        {
            Caption = 'Dept.';
            FieldClass = FlowField;
            CalcFormula = lookup("Cust. Ledger Entry"."Customer No." where("Customer No." = FIELD("No.")));
        }
        field(7; Company_ID; Decimal)
        {
            Caption = 'Company_ID';
            FieldClass = FlowField;
            CalcFormula = max("Cust. Ledger Entry"."Sales (LCY)" where("Customer No." = FIELD("No.")));
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
