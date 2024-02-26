page 50159 "Result List"
{
    ApplicationArea = All;
    Caption = 'Result List';
    PageType = List;
    SourceTable = Result;
    UsageCategory = Lists;
    CardPageId = "Result Card";
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the Result ID field.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Stream; Rec.Stream)
                {
                    ToolTip = 'Specifies the value of the Stream field.';
                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Total Marks"; Rec."Total Marks")
                {
                    ToolTip = 'Specifies the value of the Total Marks field.';
                }
                field("Obtain Marks"; Rec."Obtain Marks")
                {
                    ToolTip = 'Specifies the value of the Obtain Marks field.';
                }
            }
        }
    }
}
