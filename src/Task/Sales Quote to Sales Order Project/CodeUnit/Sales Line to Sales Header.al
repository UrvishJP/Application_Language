codeunit 50108 "Sales Line to Sales Header"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", OnBeforeTransferQuoteLineToOrderLineLoop, '', false, false)]
    local procedure OnBeforeTransferQuoteLineToOrderLineLoop(var SalesQuoteLine: Record "Sales Line"; var SalesQuoteHeader: Record "Sales Header"; var IsHandled: Boolean)
    begin

        SalesQuoteLine.SetRange("Document Type", SalesQuoteHeader."Document Type"::Quote);
        SalesQuoteLine.SetRange("Document No.", SalesQuoteHeader."No.");

        if SalesQuoteLine."Convert to Order" = false then begin
            IsHandled := true;
        end;
        if SalesQuoteLine."Convert to Order" = true then begin
            SalesQuoteLine."Order Converted" := true;
            SalesQuoteLine.Modify();
        end;
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Quote to Order", OnBeforeDeleteSalesQuote, '', false, false)]
    procedure OnBeforeDeleteSalesQuote(var IsHandled: Boolean; var QuoteSalesHeader: Record "Sales Header"; var SalesQuoteLine: Record "Sales Line")
    var

    begin
        SalesQuoteLine.SetRange("Document Type", Enum::"Sales Document Type"::Quote);
        SalesQuoteLine.SetRange("Document No.", QuoteSalesHeader."No.");
        SalesQuoteLine.SetRange("Order Converted", false);

        if SalesQuoteLine.FindFirst() then
            IsHandled := true;

    end;
}