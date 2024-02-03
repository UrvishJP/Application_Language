// pageextension 50149 CustXMLExt extends "Customer List"
// {
//     actions
//     {
//         addafter("&Customer")
//         {
//             action("Export to XML")
//             {
//                 RunObject = xmlport 50149;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//             }
//             action("Export to CSV")
//             {
//                 RunObject = xmlport 50101;
//                 Promoted = true;
//                 PromotedCategory = Category4;
//             }
//         }
//     }
// }

