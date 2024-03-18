codeunit 50220 "Processing CodeUnit"
{
    TableNo = "Purchase Order Import Table";
    trigger OnRun()

    var
        PurchaseOrder: Record "Purchase Header";
        PurchaseLine: Record "Purchase Line";
        LastOrderNo: Record "No. Series Line";
        ErrorAndWarnings: Codeunit "Error and Warning CodeUnit";
        LastID: Code[20];

    begin
        if Rec.FindFirst() then
            repeat begin

                if NOT ErrorAndWarnings.ChangeStyle(Rec) then begin

                    LastID := IncStr(LastOrderNo.GetLastNoUsed());
                    PurchaseOrder.Init();
                    PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Order;
                    PurchaseOrder."No." := LastID;
                    PurchaseOrder."Buy-from Vendor No." := Rec."Imported Vendor No.";
                    PurchaseOrder."Buy-from Vendor Name" := Rec."Imported Ship-to Name";
                    PurchaseOrder."Location Code" := Rec."Imported Location Code";
                    PurchaseOrder."Posting Date" := Rec."Posting Date";
                    PurchaseOrder."Order Date" := Rec."Order Date";
                    PurchaseOrder."Pay-to Name" := Rec."Imported Ship-to Name";
                    PurchaseOrder."Buy-from Address" := Rec."Imported Ship-to Address";
                    PurchaseOrder."Buy-from Address 2" := Rec."Imported Ship-to Address 2";
                    PurchaseOrder."Buy-from City" := Rec."Imported Ship-to City";
                    PurchaseOrder."Buy-from County" := Rec."Imported Ship-to Country Code";
                    PurchaseOrder."Buy-from Country/Region Code" := Rec."Imported Ship-to Country Code";
                    PurchaseOrder."Buy-from Post Code" := Rec."Imported Ship-to Post Code";
                    PurchaseOrder.Insert(true);

                    PurchaseLine.Init();
                    PurchaseLine."Document Type" := PurchaseLine."Document Type"::Order;
                    PurchaseLine.Type := PurchaseLine.Type::Item;
                    PurchaseLine."No." := Rec."Imported Item No.";
                    PurchaseLine."Document No." := PurchaseOrder."No.";
                    PurchaseLine.Quantity := Rec."Imported Item Quantity";
                    PurchaseLine."Unit Cost" := Rec."Imported Item Unit Price";
                    PurchaseLine."Line Discount Amount" := Rec."Imported Line Discount Amount";
                    PurchaseLine."Location Code" := Rec."Imported Location Code";
                    PurchaseLine.Insert(true);
                    Page.Run(Page::"Purchase Order", PurchaseOrder);
                    Rec.Delete();
                    Message('Vendor No. %1 Purchase Order has been created.', Rec."Imported Vendor No.");
                end
                else begin
                    Message('Vendor No. %1 Purchase Order not created because of having errors.', Rec."Imported Vendor No.");
                end;
            end;
            until Rec.Next() = 0;
    end;



}
