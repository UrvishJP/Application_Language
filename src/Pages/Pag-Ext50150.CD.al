// pageextension 50150 "Change Discription" extends "Item List"
// {

//     trigger OnOpenPage()
//     var
//         myInt: Integer;
//     begin
//         UpdateDiscription(Rec);
//     end;


//     local procedure UpdateDiscription(Rec: Record Item)

//     begin
//         repeat
//             if Rec.FindSet() then begin
//                 Rec.Description := Rec.Description + 'Urvish';
//                 Rec.Modify();
//             end;
//         until Rec.Next() = 0;
//     end;

// }

// pageextension 50150 ChangeCurrencyCode extends "Posted Purchase Invoices"

// {
//     trigger OnOpenPage()
//     var
//         myInt: Integer;
//     begin
//         ChangeCode(Rec);
//     end;

//     local procedure ChangeCode(Rec: Record "Purch. Inv. Header")

//     begin
//         if Rec.FindSet() then begin
//             Rec.ModifyAll(Rec."Currency Code", 'XYZ');
//         end;
//     end;
// }


