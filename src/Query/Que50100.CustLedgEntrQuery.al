query 50109 CustLedgEntrQuery
{
    QueryType = Normal;
    OrderBy = descending(Sum_Amount_LCY);
    TopNumberOfRows = 10;

    elements
    {
        dataitem(Customer; Customer)
        {
            column(No; "No.")
            { }
            column(Name; Name)
            { }
            column(CustomerPostingGroup; "Customer Posting Group")
            { }
            dataitem(CustLedgEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer NO." = Customer."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");
                column("Sum_Amount_LCY"; "Amount (LCY)")
                {
                    Method = Sum;
                }
            }
        }
    }

}