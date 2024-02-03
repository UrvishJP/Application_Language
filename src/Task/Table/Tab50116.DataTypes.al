table 50116 DataTypes
{
    Caption = 'DataTypes';
    DataClassification = ToBeClassified;
    
    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; Name; Text[20])
        {
            Caption = 'Name';
        }
        field(3; Employed; Boolean)
        {
            Caption = 'Employed';
        }
        field(4; Salary; Decimal)
        {
            Caption = 'Salary';
        }
        field(5; DOB; Date)
        {
            Caption = 'DOB';
        }
        field(6; WorkHours; Duration)
        {
            Caption = 'WorkHours';
        }
        field(7; Pic; Blob)
        {
            Caption = 'Pic';
            Subtype = Bitmap;
        }
        field(8; "Check In Time"; Time)
        {
            Caption = 'Check In Time';
        }
        field(9; "Check Out Time"; DateTime)
        {
            Caption = 'Check Out Time';
        }
        field(10; "Dept."; Code[20])
        {
            Caption = 'Dept.';
        }
        field(11; UniqueID; Guid)
        {
            Caption = 'UniqueID';
        }
        field(12; Gender; Option)
        {
            Caption = 'Gender';
            OptionMembers = Male, Female;
        }
        field(13; Post; Enum TaskEnum)
        {
            Caption = 'Post';
        }
        field(14; FamilyPhoto; Media)
        {
            Caption = 'FamilyPhoto';
        }
        field(16; "TableFilterField"; TableFilter)
        {
            Caption = 'TableFilterField';
        }
        field(17; "RecordIdField"; RecordId)
        {
            Caption = 'RecordIdField';
        }
        field(18; "DateFormulaField"; DateFormula)
        {
            Caption = 'DateFormulaField';
        }
        field(19; AnnualSalary; BigInteger)
        {
            Caption = 'AnnualSalary';
        }
        field(20; Media; Media)
        {
            DataClassification = ToBeClassified;
        }
        field(21; mediaset; MediaSet)
        {
            DataClassification = ToBeClassified;
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
