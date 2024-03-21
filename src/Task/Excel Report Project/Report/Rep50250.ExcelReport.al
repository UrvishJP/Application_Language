
report 50250 "Sales Register"
{
    ApplicationArea = All;
    Caption = 'Sales Register';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = true;

    dataset
    {
        dataitem(SalesInvLine; "Sales Invoice Line")
        {

            trigger OnAfterGetRecord()
            var
                SalesPerson: Record "Salesperson/Purchaser";
                CountryRegion: Record "Country/Region";
                CustomerRec: Record Customer;
                ShippingRec: Record "Shipping Agent";
                DetailedGstEntry_Rec: Record "Detailed GST Ledger Entry";

            begin
                Reset_Variables();
                SalesInvHeader.Get("Document No.");
                SerialNo += 1;
                DocNo := Format("Order No.");
                PostingDate := SalesInvLine."Posting Date";
                CustomerName := SalesInvHeader."Sell-to Customer Name";
                CustomerNo := SalesInvHeader."Sell-to Customer No.";
                SalesPersonCode := SalesInvHeader."Salesperson Code";

                if SalesPerson.Get(SalesPersonCode) then
                    SalesPersonName := SalesPerson.Name;

                City := SalesInvHeader."Ship-to City";
                ShipToName := SalesInvHeader."Ship-to Name";

                if CountryRegion.Get(SalesInvHeader."Ship-to Country/Region Code") then
                    Country_name := CountryRegion.Name;

                GST_Customer_Type := Format(SalesInvHeader."GST Customer Type");
                GSTIN := SalesInvHeader."Customer GST Reg. No.";
                "Invoice No." := SalesInvHeader."No.";
                Location_Code := SalesInvHeader."Location Code";
                Bin_Code := SalesInvLine."Bin Code";
                "Vehicle No." := SalesInvHeader."Vehicle No.";
                "Vehicle Type." := Format(SalesInvHeader."Vehicle Type");
                ExternalDocNo := SalesInvHeader."External Document No.";
                "HSN/SAC Code." := SalesInvLine."HSN/SAC Code";
                "Item No." := SalesInvLine."No.";
                "Item Name" := SalesInvLine.Description;
                "Item Category" := SalesInvLine."Item Category Code";
                "Item Variant" := SalesInvLine."Variant Code";
                UOM := "Unit of Measure";
                SalesQty := SalesInvLine.Quantity;
                UnitPrice := SalesInvLine."Unit Price";
                ItemTotalPrice := SalesInvLine."Line Amount";
                LineDiscount := SalesInvLine."Line Discount Amount";
                InvoiceDiscount := SalesInvHeader."Invoice Discount Amount";
                Total := SalesInvHeader."Amount Including VAT" - SalesInvHeader.Amount;

                if ShippingRec.Get(SalesInvHeader."Shipping Agent Code") then
                    Transport_Name := ShippingRec.Name;
                    
                CreateBody();

            end;

        }


    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(General)
                {
                    field(StartingDate; StartingDate)
                    {
                        Caption = 'Starting Date';
                        ApplicationArea = All;
                    }
                    field(EndingDate; EndingDate)
                    {
                        Caption = 'Ending Date';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        CreateHeader();
    end;

    trigger OnPostReport()
    begin
        CreateExcelReport();
    end;


    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        CustNoFilter: Text[250];
        ItemNoFilter: Text[250];
        ItemCategoryFilter: Text[250];
        DocumentTypeFilter: option Invoice,"Credit Memo";
        InvoiceNoFilter: Text[250];
        SalesInvHeader: Record "Sales Invoice Header";
        SerialNo: Integer;
        StartingDate, EndingDate : Date;
        PostingDate: Date;
        DocNo: Text[50];
        SalesPersonCode: Code[20];
        SalesPersonName: Text[50];
        CustomerNo: Code[20];
        CustomerName: Text[50];
        ShipToName: Text[50];
        City: Text[50];
        Country_name: Text[30];
        State_Description: Code[10];
        Customer_Zone: Code[10];
        Customer_Region: Code[10];
        GST_Customer_Type: Text[50];
        GSTIN: Code[20];
        "Invoice No.": Code[20];
        Location_Code: Code[10];
        Bin_Code: Code[20];
        "P.A.N. No._": Code[20];
        Transport_Name: Text[50];
        "L.R. No.": Code[20];
        "Vehicle No.": Code[20];
        "Vehicle Type.": Code[20];
        ExternalDocNo: Code[20];
        "HSN/SAC Code.": Code[10];
        "Item No.": Code[10];
        "Item Name": Text[50];
        UOM: Text[50];
        "Item Category": Code[20];
        "Item Variant": Code[20];
        SalesQty: Decimal;
        UnitPrice: Decimal;
        ItemTotalPrice: Decimal;
        LineDiscount: Decimal;
        InvoiceDiscount: Decimal;
        Total: Decimal;
        CGSTAmount: Decimal;
        SGSTAmount: Decimal;
        IGSTAmount: Decimal;
        GSTAmount: Decimal;


    local procedure CreateHeader()
    var
        SalesPerson_LRec: Record "Salesperson/Purchaser";
        SalesShipment_LRec: Record "Sales Shipment Header";
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Sr.No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Posting Date', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn('Document No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Sales Person Code', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Sales Person Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Shipping Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('City', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Country Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('State Description', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Customer Zone', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('GST Customer Type', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //GST Customer Type
        TempExcelBuffer.AddColumn('GSTIN', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //GSTIN
        TempExcelBuffer.AddColumn('Invoice No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Location', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Bin Code', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('P.A.N. No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('L.R. No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //L.R. No
        TempExcelBuffer.AddColumn('Transport Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //Vehicle No.
        TempExcelBuffer.AddColumn('Vehicle No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //Vehicle No.
        TempExcelBuffer.AddColumn('Vehicle Type.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //Vehicle No.
        TempExcelBuffer.AddColumn('External Document', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('HSN/SAC Code', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text); //HSN/SAC Code.
        TempExcelBuffer.AddColumn('Item No.', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Name', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('UOM', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Category', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Variant', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Sales Qty', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Unit Price', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Total Price', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Line Discount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Invoice Discount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('CGST Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);//CGST Amount
        TempExcelBuffer.AddColumn('SGST Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);//SGST Amount
        TempExcelBuffer.AddColumn('IGST Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);//IGST Amount
        TempExcelBuffer.AddColumn('GST Amount', false, '', true, false, false, '', TempExcelBuffer."Cell Type"::Text);//GST Amount


    end;

    local procedure CreateBody()
    begin
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn(SerialNo, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(PostingDate, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(DocNo, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(SalesPersonCode, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(SalesPersonName, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustomerNo, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CustomerName, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(ShipToName, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(city, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Country_name, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(State_Description, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Customer_Zone, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(GST_Customer_Type, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //GST Customer Type
        TempExcelBuffer.AddColumn(GSTIN, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //GSTIN
        TempExcelBuffer.AddColumn("Invoice No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Location_Code, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(Bin_Code, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("P.A.N. No._", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("L.R. No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //L.R. No
        TempExcelBuffer.AddColumn(Transport_Name, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //Vehicle No.
        TempExcelBuffer.AddColumn("Vehicle No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //Vehicle No.
        TempExcelBuffer.AddColumn("Vehicle Type.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //Vehicle No.
        TempExcelBuffer.AddColumn(ExternalDocNo, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("HSN/SAC Code.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text); //HSN/SAC Code.
        TempExcelBuffer.AddColumn("Item No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Item Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(UOM, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn("Item Category", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn("Item Variant", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(SalesQty, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(UnitPrice, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(ItemTotalPrice, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(LineDiscount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(InvoiceDiscount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(Total, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
        TempExcelBuffer.AddColumn(CGSTAmount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);//CGST Amount
        TempExcelBuffer.AddColumn(SGSTAmount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);//SGST Amount
        TempExcelBuffer.AddColumn(IGSTAmount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);//IGST Amount
        TempExcelBuffer.AddColumn(GSTAmount, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);//GST Amount
    end;

    local procedure CreateExcelReport()

    begin
        TempExcelBuffer.CreateNewBook('Sales_Register');
        TempExcelBuffer.WriteSheet('Sales_Register', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Sales_Register');
        TempExcelBuffer.OpenExcel();
    end;

    local procedure Reset_Variables()
    begin
        PostingDate := 0D;
        StartingDate := 0D;
        EndingDate := 0D;
        Country_name := '';
        State_Description := '';
        Customer_Zone := '';
        Customer_Region := '';
        GST_Customer_Type := '';
        SalesPersonName := '';
        GSTIN := '';
        "Invoice No." := '';
        Location_Code := '';
        Bin_Code := '';
        "P.A.N. No._" := '';
        Transport_Name := '';
        "L.R. No." := '';
        "Vehicle No." := '';
        "Vehicle Type." := '';
        ExternalDocNo := '';
        "HSN/SAC Code." := '';
        "Item No." := '';
        "Item Name" := '';
        UOM := '';
        "Item Category" := '';
        "Item Variant" := '';
        SalesQty := 0;
        UnitPrice := 0;
        ItemTotalPrice := 0;
        LineDiscount := 0;
        InvoiceDiscount := 0;
        Total := 0;
        CGSTAmount := 0;
        SGSTAmount := 0;
        IGSTAmount := 0;
        GSTAmount := 0;
    end;
}


