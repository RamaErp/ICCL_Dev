table 70106 "vwSTRESS_EQ_StressTestData"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; StressTestDate; DateTime)
        {
        }

        field(2; DataSource; Code[20])
        {
        }

        field(3; SettType; Code[3])
        {
        }

        field(4; SettNo; Code[10])
        {
        }

        field(5; MemberCode; Code[10])
        {
        }

        field(6; ScripCode; Code[12])
        {
        }

        field(7; TotalBuyQty; Decimal)
        {

        }

        field(8; TotalSellQty; Decimal)
        {

        }

        field(9; SecPayOutQty; Decimal)
        {

        }

        field(10; SecPayInQty; Decimal)
        {

        }

        field(11; RetailBuyQty; Decimal)
        {

        }

        field(12; RetailSellQty; Decimal)
        {

        }

        field(13; TotalBuyValue; Decimal)
        {

        }

        field(14; TotalSellValue; Decimal)
        {

        }

        field(15; TotalFundsPayIn; Decimal)
        {

        }

        field(16; TotalFundsPayOut; Decimal)
        {

        }

        field(17; TotalCustRejectBuyQty; Decimal)
        {

        }

        field(18; TotalCustRejectSellQty; Decimal)
        {

        }

        field(19; TotalCustRejectBuyValue; Decimal)
        {

        }

        field(20; TotalCustRejectSellValue; Decimal)
        {

        }

        field(21; CustOblBuyForMember; Decimal)
        {

        }

        field(22; CustOblSellForMember; Decimal)
        {

        }

        field(23; ClosingPrice; Decimal)
        {

        }

        field(24; TotalBuyValueOnCP; Decimal)
        {

        }

        field(25; TotalSellValueOnCP; Decimal)
        {

        }

        field(26; SecPayInFailLoss; Decimal)
        {

        }

        field(27; FundsPayInFailLoss; Decimal)
        {

        }

        field(28; GrossLoss; Decimal)
        {

        }

        field(29; RequiredMargin; Decimal)
        {

        }

        field(30; NetLoss; Decimal)
        {

        }

        field(31; TMCode; Code[10])
        {
        }
        field(32; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Entry No.';
        }
    }

    keys
    {
        key(PK; "Entry No.",StressTestDate, SettNo, MemberCode, ScripCode)
        {
            Clustered = true;
        }
    }
}
