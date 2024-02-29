codeunit 50160 "Line Reference"
{
    
    [EventSubscriber(ObjectType::Table, Database::"Item Journal Line", OnAfterCopyItemJnlLineFromPurchLine, '', false, false)]
    local procedure MyProcedure1(PurchLine: Record "Purchase Line"; var ItemJnlLine: Record "Item Journal Line")
    begin
        ItemJnlLine."Line Reference" := PurchLine."Line Reference";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnAfterInitItemLedgEntry, '', false, false)]
    local procedure MyProcedure2(var ItemJournalLine: Record "Item Journal Line"; var NewItemLedgEntry: Record "Item Ledger Entry")
    begin
        NewItemLedgEntry."Line Reference" := ItemJournalLine."Line Reference";
    end;



    [EventSubscriber(ObjectType::Table, Database::"Purch. Cr. Memo Line", OnAfterInitFromPurchLine, '', false, false)]
    local procedure MyProcedure3(var PurchCrMemoLine: Record "Purch. Cr. Memo Line"; PurchLine: Record "Purchase Line")
    begin
        PurchCrMemoLine."Line Reference" := PurchLine."Line Reference";
    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", OnBeforeInsertValueEntry, '', false, false)]
    local procedure MyProcedure4(var ValueEntry: Record "Value Entry"; ItemJournalLine: Record "Item Journal Line")
    begin
        ValueEntry."Line Reference" := ItemJournalLine."Line Reference";
    end;



    [EventSubscriber(ObjectType::Table, Database::"Return Shipment Line", OnAfterInitFromPurchLine, '', false, false)]
    local procedure MyProcedure5(PurchLine: Record "Purchase Line"; var ReturnShptLine: Record "Return Shipment Line")
    begin
        ReturnShptLine."Line Reference" := PurchLine."Line Reference";
    end;

}
