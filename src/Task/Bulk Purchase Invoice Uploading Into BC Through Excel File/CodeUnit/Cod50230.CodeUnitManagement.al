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
        if not ImpBatch.FindFirst() then begin
            ImpBatch.Init();
            ImpBatch.Name := 'DEFAULT';
            ImpBatch.Description := 'Default';
            ImpBatch."Reading CodeUnit" := Read;
            ImpBatch."Validation CodeUnit" := Validate;
            ImpBatch."Processing CodeUnit" := Processing;
            ImpBatch.Insert();
        end else
            repeat
                ImpBatch."Reading CodeUnit" := Read;
                ImpBatch."Validation CodeUnit" := Validate;
                ImpBatch."Processing CodeUnit" := Processing;
                ImpBatch.Modify();
            until ImpBatch.Next() = 0;
    end;
}
