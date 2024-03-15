codeunit 50220 "Processing CodeUnit"
{
    procedure CreatePurchaseOrder(Rec: Record "Purchase Order Import Table")
    var
        myInt: Integer;
    begin
        PurchaseOrder.Init();
        PurchaseOrder."Document Type" := PurchaseOrder."Document Type"::Order;
        PurchaseOrder."No." := Format(104002);

        PurchaseOrder.get(Rec."Imported Vendor No.");
    
        if (Rec."Imported Vendor No." = PurchaseOrder."Buy-from Vendor No.") and (Rec."Imported Vendor No." = PurchaseOrder."Pay-to Vendor No.") then begin
            PurchaseOrder."Buy-from Address" := Rec."Imported Ship-to Address";
            PurchaseOrder."Buy-from Address 2" := Rec."Imported Ship-to Address 2";
            Message('ravi ;-;');
            PurchaseOrder.Insert();
            PurchaseOrder.Modify();
        end;
    end;

    var
        PurchaseOrder: Record "Purchase Header";

}
