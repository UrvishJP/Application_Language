// tableextension 50134 "Sales Line Ext" extends "Sales Line"
// {
//     fields
//     {
//         modify("No.")
//         {
//             trigger OnAfterValidate()
//             var
//                 Info: Record Item;

//             begin
//                 Info.Get("No.");
//                 "Bin Reference" := Info."Bin Reference";
//             end;
//         }
//         field(50100; "Bin Reference"; Text[50])
//         {
//             Caption = 'Bin Reference';
//             DataClassification = ToBeClassified;
//         }
//     }
// }
