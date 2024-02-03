page 50120 "Enrollment Page"
{
    ApplicationArea = All;
    Caption = 'Enrollment Page';
    PageType = Card;
    SourceTable = Enrollment;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Enrollment No."; Rec."Enrollment No.")
                {
                    Caption = 'Enrollment No.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Profile Photo"; Rec."Profile Photo")
                {
                    ToolTip = 'Specifies the value of the Profile Photo field.';
                }
            }
        }
    }
}
