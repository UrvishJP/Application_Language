reportextension 50160 "Bank Deposit Ext." extends "Bank Deposit"
{
    dataset
    {
        add("Posted Bank Deposit Line")
        {
            column(Bank_Deposit_No; "Posted Bank Deposit Line"."Bank Deposit No.")
            {

            }
        }
    }
    rendering
    {
        layout(RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/Task/Report Ext Project/BankDeposit.RDL';
        }
    }
}
