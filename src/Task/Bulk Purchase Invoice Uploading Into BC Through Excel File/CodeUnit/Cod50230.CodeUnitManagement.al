codeunit 50230 "CodeUnit Management"
{
    Subtype = Install;
    trigger OnInstallAppPerCompany()
    begin
        ManageCodeUnit(Codeunit::"Import Export Data", Codeunit::"Error and Warning CodeUnit", Codeunit::"Processing CodeUnit");
    end;

    procedure ManageCodeUnit(Read: Integer; Validate: Integer; Processing: Integer)

    var
        ImpBatch: Record "Purchase Order Import Batches";

    begin
        if ImpBatch.IsEmpty() then begin
            ImpBatch.Init();
            ImpBatch.Description := 'Default';
            ImpBatch.Name := 'DEFAULT';
            ImpBatch."Reading CodeUnit" := Read;
            ImpBatch."Validation CodeUnit" := Validate;
            ImpBatch."Processing CodeUnit" := Processing;
            ImpBatch.Insert();
        end;
    end;
}
