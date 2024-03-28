// report 50104 "Customer Report"
// {
//     ApplicationArea = All;
//     Caption = 'Customer Report';
//     UsageCategory = ReportsAndAnalysis;
//     RDLCLayout = 'Customer Report.RDL';
//     DefaultLayout = RDLC;
//     // AllowScheduling= false;

//     dataset
//     {
//         dataitem(Item; Item)
//         {
//             // PrintOnlyIfDetail = true;
//             DataItemTableView = sorting("No.") ORDER(descending);

//             column(No; "No.")
//             {

//             }
//             column(Name; "Item Tracking Code")
//             {
//             }
//             dataitem(Vendor; "Purch. Inv. Line")
//             {
//                 DataItemLink = "No." = field("No.");

//                 column(Document_No_; "Document No.")
//                 {
//                 }
//             }
//         }
//     }
//     requestpage
//     {
//         layout
//         {
//             area(content)
//             {
//                 group(GroupName)
//                 {
//                 }
//             }
//         }
//         actions
//         {
//             area(processing)
//             {
//             }
//         }
//     }
// }
