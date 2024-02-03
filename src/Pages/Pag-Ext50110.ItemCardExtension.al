pageextension 50111 ItemCardExtension extends "Item Card"
{
    actions
    {
        addafter(functions)
        {
            action(ImportItemPicture)
            {
                ApplicationArea = All;
                Caption = 'Import Item Picture';
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()

                var
                    ImageManagement: CodeUnit ImageManagement;
                begin
                    ImageManagement.ImportItemPicture(Rec);
                end;
            }
            action(ExportItemPicture)
            {
                ApplicationArea = All;
                Caption = 'Export Item Picture';
                Promoted = true;
                PromotedCategory = Category4;

                trigger OnAction()

                var
                    ImageManagement: CodeUnit ImageManagement;
                begin
                    ImageManagement.ExportItemPicture(Rec);
                end;
            }
        }
    }
}

