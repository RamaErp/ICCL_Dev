table 70150 "CurrentDerivativesInputs"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "CmCode"; Integer) { }
        field(2; "TmCode"; Integer) { }
        field(3; "ClientCode"; Code[20]) { }
        field(4; "ProductType"; Code[10]) { }
        field(5; "SeriesId"; Code[20]) { }
        field(6; "StrikePrice"; Decimal) { }
        field(7; "CallPut"; Code[5]) { }
        field(8; "AssetCode"; Code[20]) { }
        field(9; "SeriesCode"; Code[30]) { }
        field(10; "MarketLot"; Integer) { }
        field(11; "UnderLyingId"; Integer) { }
        field(12; "PreDayClosePrice"; Decimal) { }
        field(13; "TodayClosePrice"; Decimal) { }
        field(14; "CPCode"; Code[10]) { }
        field(15; "NetQty"; Integer) { }
        field(16; "NetValue"; Decimal) { }
        field(17; "NetValueOnTodayClosePrice"; Decimal) { }

        field(18; "Scenario1A_Increase"; Decimal) { }
        field(19; "Scenario1B_Increase"; Decimal) { }
        field(20; "Scenario2A_Decrease"; Decimal) { }
        field(21; "Scenario2B_Decrease"; Decimal) { }

        field(22; "Scenario3PriceMax"; Decimal) { }
        field(23; "Scenario4PriceMin"; Decimal) { }
        field(43; "Entry No"; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "Entry No", "CmCode", "TmCode", "ClientCode", "SeriesId") { Clustered = true; }
    }
}
