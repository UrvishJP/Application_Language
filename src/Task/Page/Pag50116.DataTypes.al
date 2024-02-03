page 50116 DataTypes
{
    ApplicationArea = all;
    Caption = 'DataTypes';
    PageType = Card;
    SourceTable = DataTypes;
    UsageCategory = Lists;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field(AnnualSalary; Rec.AnnualSalary)
                {
                    ToolTip = 'Specifies the value of the AnnualSalary field.';
                }
                field("Check In Time"; Rec."Check In Time")
                {
                    ToolTip = 'Specifies the value of the Check In Time field.';
                }
                field("Check Out Time"; Rec."Check Out Time")
                {
                    ToolTip = 'Specifies the value of the Check Out Time field.';
                }
                field(DOB; Rec.DOB)
                {
                    ToolTip = 'Specifies the value of the DOB field.';
                }
                field(DateFormulaField; Rec.DateFormulaField)
                {
                    ToolTip = 'Specifies the value of the DateFormulaField field.';
                }
                field("Dept."; Rec."Dept.")
                {
                    ToolTip = 'Specifies the value of the Dept. field.';
                }
                field(Employed; Rec.Employed)
                {
                    ToolTip = 'Specifies the value of the Employed field.';
                }
                field(FamilyPhoto; Rec.FamilyPhoto)
                {
                    ToolTip = 'Specifies the value of the FamilyPhoto field.';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Pic; Rec.Pic)
                {
                    ToolTip = 'Specifies the value of the Pic field.';
                }
                field(Post; Rec.Post)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Post field.';
                }
                field(RecordIdField; Rec.RecordIdField)
                {
                    ToolTip = 'Specifies the value of the RecordIdField field.';
                }
                field(Salary; Rec.Salary)
                {
                    ToolTip = 'Specifies the value of the Salary field.';
                }
                field(TableFilterField; Rec.TableFilterField)
                {
                    ToolTip = 'Specifies the value of the TableFilterField field.';
                }
                field(UniqueID; Rec.UniqueID)
                {
                    ToolTip = 'Specifies the value of the UniqueID field.';
                }
                field(WorkHours; Rec.WorkHours)
                {
                    ToolTip = 'Specifies the value of the WorkHours field.';
                }
            }
        }
        area(FactBoxes)
        {
            part(MediaDataType; Media)
            {
                
            }
            part(MediaSetDataType; MediaSet)
            {

            }
        }
    }
}
