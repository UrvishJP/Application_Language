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

        ImpToPurchaseOrder.Reset();

        if ImpToPurchaseOrder.FindLast() then
            MaxRow := TempExcelBuffer."Row No.";


        for RowNo := 2 to MaxRow do begin
            ImpToPurchaseOrder.Init();
            ImpToPurchaseOrder."Imported Vendor No." := GetValueAtCell(RowNo, 1);
            ImpToPurchaseOrder."Imported Item No." := GetValueAtCell(RowNo, 2);
            ImpToPurchaseOrder."Imported Ship-to Address" := GetValueAtCell(RowNo, 10);
            ImpToPurchaseOrder."Imported Ship-to Address 2" := GetValueAtCell(RowNo, 11);
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
