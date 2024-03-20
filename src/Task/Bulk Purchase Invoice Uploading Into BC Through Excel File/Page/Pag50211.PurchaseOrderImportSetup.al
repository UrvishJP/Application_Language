page 50211 "Purchase Order Import Setup"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Import Setup';
    PageType = Card;
    SourceTable = "Purchase Order Import Setup";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Reset Order Upon"; Rec."Release Order Upon Create")
                {
                    ToolTip = 'Specifies the value of the Reset Order Upon field.';
                }
                field("Override Sales Person"; Rec."Override Sales Person")
                {
                    ToolTip = 'Specifies the value of the Override Sales Person field.';
                }
            }
        }
    }
}
