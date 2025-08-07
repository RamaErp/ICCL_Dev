table 70152 CurrentDerivativesOutputs
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sr. No."; Integer) { DataClassification = SystemMetadata; }
        field(2; "CmCode"; Integer) { }
        field(3; "TmCode"; Integer) { }
        field(4; "ClientCode"; Code[20]) { }
        field(5; "ProductType"; Code[20]) { }
        field(6; "SeriesId"; Code[20]) { }
        field(7; "StrikePrice"; Decimal) { }
        //   field(8; "Call/Put"; Option) 
        //   {
        //       OptionMembers = ,Call,Put;
        //       OptionCaption = ',Call,Put';
        //   }
        field(8; "CallPut"; Code[5]) { }
        field(9; "AssetCode"; Code[20]) { }
        field(10; "SeriesCode"; Code[50]) { }
        field(11; "MarketLot"; Integer) { }
        field(12; "UnderLyingId"; Integer) { }
        field(13; "PreDayClosePrice"; Decimal) { }
        field(14; "TodayClosePrice"; Decimal) { }
        field(15; "CPCode"; Code[20]) { }
        field(16; "NetQty"; Decimal) { }
        field(17; "NetValue"; Decimal) { }
        field(18; "NetValueOnTodayClosePrice"; Decimal) { }
        field(19; "Scenario1APrice"; Decimal) { }
        field(20; "Scenario1BPrice"; Decimal) { }
        field(21; "Scenario2APrice"; Decimal) { }
        field(22; "Scenario2BPrice"; Decimal) { }
        field(23; "Scenario3PriceMax"; Decimal) { }
        field(24; "Scenario4PriceMax"; Decimal) { }
        field(25; "NetValueOnScenario1A"; Decimal) { }
        field(26; "NetValueOnScenario1B"; Decimal) { }
        field(27; "NetValueOnScenario2A"; Decimal) { }
        field(28; "NetValueOnScenario2B"; Decimal) { }
        field(29; "NetValueOnScenario3"; Decimal) { }
        field(30; "NetValueOnScenario4"; Decimal) { }
        field(31; "ProfitLossScenario1A"; Decimal) { }
        field(32; "ProfitLossScenario1B"; Decimal) { }
        field(33; "ProfitLossScenario2A"; Decimal) { }
        field(34; "ProfitLossScenario2B"; Decimal) { }
        field(35; "ProfitLossScenario3"; Decimal) { }
        field(36; "ProfitLossScenario4"; Decimal) { }
    }

    keys
    {
        key(PK; "Sr. No.") { Clustered = true; }
    }
}
