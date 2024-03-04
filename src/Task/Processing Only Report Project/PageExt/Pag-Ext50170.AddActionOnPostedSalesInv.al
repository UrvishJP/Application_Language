pageextension 50170 "Add Action On Posted Sales Inv" extends "Posted Sales Invoices"
{
    

    actions
    {

        addafter("Update Document")
        {

            group(Report)
            {
                action("Sales Person Code")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Report;

                    trigger OnAction()

                    begin
                        Report.RunModal(Report::"Sales Person Code");
                    end;
                }
                action("External Document No.")
                {
                    ApplicationArea = All;
                    Promoted = true;
                    PromotedCategory = Report;

                    trigger OnAction()

                    begin
                        Report.RunModal(Report::"External Doc No");
                    end;
                }
            }
        }
    }
}
