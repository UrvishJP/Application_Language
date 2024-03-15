codeunit 50200 "Import Export Data"
{
    //Export Layout to Excel
    procedure ExportToExcel(var ExpToExcel: Record "Purchase Order Import Table")

    var
        TempExcelBuffer: Record "Excel Buffer" temporary;
        DataLabel: Label 'Purchase Order Excel Data';
        ExcelFileName: Label 'Purchase Order_%1_%2';

    begin
        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.NewRow();


        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Batch Name"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Vendor No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Item No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Location Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to Country Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Shipping Agent Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption(ImportedShippingAgentService), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported External Document No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Shipment Date"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to Name"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to Address"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to Address 2"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to City"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to State"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Ship-to Post Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Item Quantity"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Item Unit Price"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Imported Line Discount Amount"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Vendor No."), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Posting Date"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Order Date"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Shipping Agent Code"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(expToExcel.FieldCaption("Shipping Agent Service"), false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);


        if ExpToExcel.FindSet() then
            repeat
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn(expToExcel."Batch Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Vendor No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Item No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Location Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to Country Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Shipping Agent Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel.ImportedShippingAgentService, false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported External Document No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Shipment Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to Name", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to Address", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to Address 2", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to City", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to State", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Ship-to Post Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Item Quantity", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Item Unit Price", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Imported Line Discount Amount", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Vendor No.", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Posting Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(expToExcel."Order Date", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Date);
                TempExcelBuffer.AddColumn(expToExcel."Shipping Agent Code", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(expToExcel."Shipping Agent Service", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);

            until ExpToExcel.Next() = 0;

        TempExcelBuffer.CreateNewBook(DataLabel);
        TempExcelBuffer.WriteSheet(DataLabel, 'QQ', UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename(StrSubstNo(ExcelFileName, CurrentDateTime, UserId));
        TempExcelBuffer.OpenExcel();

    end;

    //Import data to BC from Excel

    trigger OnRun()

    begin
        ReadData();
        ImpFromExcel();
    end;

    procedure ReadData()

    var
        FileManagement: Codeunit "File Management";
        IsStream: InStream;
        FromFile: Text[100];

    begin
        UploadIntoStream(UploadMsg, '', '', FromFile, IsStream);

        if FromFile <> '' then begin
            FileName := FileManagement.GetFileName(FromFile);
            SheetName := TempExcelBuffer.SelectSheetsNameStream(IsStream);
        end else
            Error(NoFileMsg);

        TempExcelBuffer.Reset();
        TempExcelBuffer.DeleteAll();
        TempExcelBuffer.OpenBookStream(IsStream, SheetName);
        TempExcelBuffer.ReadSheet();
    end;

    procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text

    begin
        TempExcelBuffer.Reset();

        if TempExcelBuffer.Get(RowNo, ColNo) then
            exit(TempExcelBuffer."Cell Value as Text")
        else
            exit('');
    end;

    procedure ImpFromExcel()

    var
        ImpToPurchaseOrder: Record "Purchase Order Import Table";
        RowNo: Integer;
        ColNo: Integer;
        LineNo: Integer;
        MaxRow: Integer;


    begin

        RowNo := 0;
        ColNo := 0;
        LineNo := 0;
        MaxRow := 0;

        TempExcelBuffer.Reset();
        ImpToPurchaseOrder.Reset();

        if TempExcelBuffer.FindLast() then
            MaxRow := TempExcelBuffer."Row No.";

        for RowNo := 2 to MaxRow do begin

            ImpToPurchaseOrder.Init();
            ImpToPurchaseOrder."Line No" := LineNo;
            ImpToPurchaseOrder."Batch Name" := GetValueAtCell(RowNo, 1);
            ImpToPurchaseOrder."Imported Vendor No." := GetValueAtCell(RowNo, 2);
            ImpToPurchaseOrder."Imported Item No." := GetValueAtCell(RowNo, 3);
            ImpToPurchaseOrder."Imported Location Code" := GetValueAtcell(RowNo, 4);
            ImpToPurchaseOrder."Imported Ship-to Country Code" := GetValueAtcell(RowNo, 5);
            ImpToPurchaseOrder."Imported Shipping Agent Code" := GetValueAtcell(RowNo, 6);
            ImpToPurchaseOrder.ImportedShippingAgentService := GetValueAtcell(RowNo, 7);
            ImpToPurchaseOrder."Imported External Document No." := GetValueAtcell(RowNo, 8);
            Evaluate(ImpToPurchaseOrder."Imported Shipment Date", GetValueAtcell(RowNo, 9));
            ImpToPurchaseOrder."Imported Ship-to Name" := GetValueAtcell(RowNo, 10);
            ImpToPurchaseOrder."Imported Ship-to Address" := GetValueAtcell(RowNo, 11);
            ImpToPurchaseOrder."Imported Ship-to Address 2" := GetValueAtcell(RowNo, 12);
            ImpToPurchaseOrder."Imported Ship-to City" := GetValueAtcell(RowNo, 13);
            ImpToPurchaseOrder."Imported Ship-to State" := GetValueAtcell(RowNo, 14);
            ImpToPurchaseOrder."Imported Ship-to Post Code" := GetValueAtcell(RowNo, 15);
            Evaluate(ImpToPurchaseOrder."Imported Item Quantity", GetValueAtcell(RowNo, 16));
            Evaluate(ImpToPurchaseOrder."Imported Item Unit Price", GetValueAtcell(RowNo, 17));
            Evaluate(ImpToPurchaseOrder."Imported Line Discount Amount", GetValueAtcell(RowNo, 18));
            ImpToPurchaseOrder."Vendor No." := GetValueAtcell(RowNo, 19);
            Evaluate(ImpToPurchaseOrder."Posting Date", GetValueAtcell(RowNo, 20));
            Evaluate(ImpToPurchaseOrder."Order Date", GetValueAtcell(RowNo, 21));
            Evaluate(ImpToPurchaseOrder."Shipping Agent Code", GetValueAtcell(RowNo, 22));
            Evaluate(ImpToPurchaseOrder."Shipping Agent Service", GetValueAtcell(RowNo, 23));

            ImpToPurchaseOrder.Insert();
            ImpToPurchaseOrder.Modify();
        end;

        Message(ExcelImpSuccess);

    end;


    var
        FileName: Text[100];
        SheetName: Text[100];
        TempExcelBuffer: Record "Excel Buffer" temporary;
        UploadMsg: Label 'Choose the file for importing into Business Central.';
        NoFileMsg: Label 'No Excel file found.';
        ExcelImpSuccess: Label 'Data successfully imported from Excel.';

}
