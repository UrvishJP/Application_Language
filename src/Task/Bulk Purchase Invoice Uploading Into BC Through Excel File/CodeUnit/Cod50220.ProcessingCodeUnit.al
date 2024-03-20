codeunit 50226 "Processing CodeUnit"
{

    TableNo = "Purchase Order Import Table";

    trigger OnRun()

    begin
        createPurchaseOrder(Rec);
    end;

    procedure createPurchaseOrder(var rec: Record "Purchase Order Import Table")

    var

        PurchHeader_rec: Record "Purchase Header";
        PurchLine_rec: Record "Purchase Line";
        NoSeries_rec: Record "No. Series Line";
        Line: code[30];
        Validate_rec: Codeunit "Error and Warning CodeUnit";
        setup: Record "Purchase Order Import SetUp";
        lineNo: Integer;
        ReleasePurchDoc: Codeunit "Release Purchase Document";

    begin

        if rec.FindFirst() then begin

            repeat

                Line := IncStr(NoSeries_rec.GetLastNoUsed());

                if NOT (Validate_rec.ChangeStyle(rec)) then begin

                    if NOT CheckBeforeInsert(rec, PurchLine_rec, PurchHeader_rec) then begin

                        PurchHeader_rec.Init();
                        PurchHeader_rec."No." := Line;
                        PurchHeader_rec."Document Type" := PurchHeader_rec."Document Type"::Order;
                        PurchHeader_rec.Validate("Buy-from Vendor No.", rec."Imported Vendor No.");
                        PurchHeader_rec."Pay-to Address" := rec."Imported Ship-to Address";
                        PurchHeader_rec."Pay-to Address 2" := rec."Imported Ship-to Address 2";
                        PurchHeader_rec."Ship-to City" := rec."Imported Ship-to City";
                        PurchHeader_rec."Ship-to Country/Region Code" := rec."Imported Ship-to Country Code";
                        PurchHeader_rec."Ship-to Code" := rec."Imported Ship-to Post Code";
                        PurchHeader_rec."Order Date" := rec."Order Date";
                        PurchHeader_rec.Insert(true);

                        if setup.FindSet() then begin
                            PurchHeader_rec."Purchaser Code" := setup."Override Sales Person";
                        end;

                        PurchLine_rec.Init();
                        PurchLine_rec."Document Type" := PurchLine_rec."Document Type"::Order;
                        PurchLine_rec.Type := PurchLine_rec.Type::Item;
                        PurchLine_rec."Document No." := PurchHeader_rec."No.";
                        PurchLine_rec.Quantity := Rec."Imported Item Quantity";
                        PurchLine_rec."Unit Price (LCY)" := Rec."Imported Item Unit Price";
                        PurchLine_rec."Line Discount Amount" := Rec."Imported Line Discount Amount";
                        PurchLine_rec."Location Code" := Rec."Imported Location Code";
                        PurchLine_rec.Validate("No.", rec."Imported Item No.");
                        PurchLine_rec.Insert(true);

                        if setup.FindFirst() then begin

                            if setup."Release Order Upon Create" = true then
                                ReleasePurchDoc.PerformManualRelease(PurchHeader_rec);

                        end;

                    end;

                    rec.Delete();
                    
                    Message('Purchase Order No. %1 of Item No. %2 has been created.', rec."Imported Vendor No.", rec."Imported Item No.");

                end

                else begin
                    Message('Purchase Order No. %1 of Item No. %2 not created, please check errors.', rec."Imported Vendor No.", rec."Imported Item No.");
                end;

            until rec.Next() = 0;
        end;
    end;

    procedure CheckBeforeInsert(var PurchaseImportOrder_rec: Record "Purchase Order Import Table"; var PurchLine_rec: Record "Purchase Line"; var PurchHeader_rec: Record "Purchase Header"): Boolean

    var

        lastLine: Record "Purchase Line";
        ReleasePurchDoc: Codeunit "Release Purchase Document";

    begin

        purchHeader_rec.SetRange("Buy-from Vendor No.", PurchaseImportOrder_rec."Imported Vendor No.");

        if purchHeader_rec.FindFirst() then begin
            if PurchHeader_rec.Status = PurchHeader_rec.Status::Released then begin
                ReleasePurchDoc.PerformManualReopen(PurchHeader_rec);
            end;

            lastLine.Reset();
            lastLine.SetRange("Document Type", PurchHeader_rec."Document Type"::Order);
            lastLine.SetRange("Document No.", PurchHeader_rec."No.");

            if lastLine.FindLast() then begin
                PurchLine_rec.Init();
                PurchLine_rec."Line No." := lastLine."Line No." + 10000;
                PurchLine_rec."Location Code" := PurchaseImportOrder_rec."Imported Location Code";
                PurchLine_rec."Document Type" := PurchLine_rec."Document Type"::Order;
                PurchLine_rec."Document No." := PurchHeader_rec."No.";
                PurchLine_rec.Type := PurchLine_rec.Type::Item;
                PurchLine_rec.Quantity := PurchaseImportOrder_rec."Imported Item Quantity";
                PurchLine_rec."Unit Cost (LCY)" := PurchaseImportOrder_rec."Imported Item Unit Price";
                PurchLine_rec."Inv. Discount Amount" := PurchaseImportOrder_rec."Imported Line Discount Amount";

                PurchLine_rec.Validate(Description, PurchaseImportOrder_rec."Imported Item No.");

                PurchLine_rec.Insert(true);

                if PurchHeader_rec.Status = PurchHeader_rec.Status::Open then
                    ReleasePurchDoc.PerformManualRelease(PurchHeader_rec);

                exit(true);
            end;
        end;
    end;
}