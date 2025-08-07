table 70153 "ClientSeriesLevelProfitLoss"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CmCode"; Code[20]) { }
        field(2; "TmCode"; Code[20]) { }
        field(3; "ClientCode"; Code[20]) { }
        field(4; "ProductType"; Code[10]) { }
        field(5; "SeriesId"; Code[20]) { }
        field(6; "StrikePrice"; Decimal) { }
        field(7; "CallPut"; Option)
        {
            OptionMembers = F,P,C;
        }
        field(8; "AssetCode"; Code[10]) { }
        field(9; "SeriesCode"; Code[20]) { }
        field(10; "MarketLot"; Integer) { }
        field(11; "UnderLyingId"; Code[20]) { }
        field(12; "PreDayClosePrice"; Decimal) { }
        field(13; "TodayClosePrice"; Decimal) { }
        field(14; "CPCode"; Code[20]) { }
        field(15; "NetQty"; Integer) { }
        field(16; "NetValue"; Decimal) { }
        field(17; "NetValueOnTodayClosePrice"; Decimal) { }
        field(18; "Scenario1AIncrease"; Decimal) { }
        field(19; "Scenario1BIncrease"; Decimal) { }
        field(20; "Scenario2ADecrease"; Decimal) { }
        field(21; "Scenario2BDecrease"; Decimal) { }
        field(22; "Scenario3PriceMax"; Decimal) { }
        field(23; "Scenario4PriceMin"; Decimal) { }
        field(24; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(PK; "Entry No.", "CmCode", "TmCode", "ClientCode", "SeriesId") { Clustered = true; }
    }
}
