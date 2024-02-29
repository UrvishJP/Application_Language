tableextension 50164 "Line Ref. On Memo" extends "Purch. Cr. Memo Line"
{
    fields
    {
        field(50104; "Line Reference"; Text[50])
        {
            Caption = 'Line Reference';
            DataClassification = ToBeClassified;
        }
    }
}
