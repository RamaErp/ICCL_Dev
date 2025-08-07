page 70152 CurrentDerivativesOutputs
{
    PageType = List;
    SourceTable = CurrentDerivativesOutputs;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Current Derivatives Outputs';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sr. No."; Rec."Sr. No.") { }
                field("CmCode"; Rec."CmCode") { }
                field("TmCode"; Rec."TmCode") { }
                field("ClientCode"; Rec."ClientCode") { }
                field("ProductType"; Rec."ProductType") { }
                field("SeriesId"; Rec."SeriesId") { }
                field("StrikePrice"; Rec."StrikePrice") { }
                field(CallPut; Rec.CallPut) { }
                field("AssetCode"; Rec."AssetCode") { }
                field("SeriesCode"; Rec."SeriesCode") { }
                field("MarketLot"; Rec."MarketLot") { }
                field("UnderLyingId"; Rec."UnderLyingId") { }
                field("PreDayClosePrice"; Rec."PreDayClosePrice") { }
                field("TodayClosePrice"; Rec."TodayClosePrice") { }
                field("CPCode"; Rec."CPCode") { }
                field("NetQty"; Rec."NetQty") { }
                field("NetValue"; Rec."NetValue") { }
                field("NetValueOnTodayClosePrice"; Rec."NetValueOnTodayClosePrice") { }
                field("Scenario1APrice"; Rec."Scenario1APrice") { }
                field("Scenario1BPrice"; Rec."Scenario1BPrice") { }
                field("Scenario2APrice"; Rec."Scenario2APrice") { }
                field("Scenario2BPrice"; Rec."Scenario2BPrice") { }
                field("Scenario3PriceMax"; Rec."Scenario3PriceMax") { }
                field("Scenario4PriceMax"; Rec."Scenario4PriceMax") { }
                field("NetValueOnScenario1A"; Rec."NetValueOnScenario1A") { }
                field("NetValueOnScenario1B"; Rec."NetValueOnScenario1B") { }
                field("NetValueOnScenario2A"; Rec."NetValueOnScenario2A") { }
                field("NetValueOnScenario2B"; Rec."NetValueOnScenario2B") { }
                field("NetValueOnScenario3"; Rec."NetValueOnScenario3") { }
                field("NetValueOnScenario4"; Rec."NetValueOnScenario4") { }
                field("ProfitLossScenario1A"; Rec."ProfitLossScenario1A") { }
                field("ProfitLossScenario1B"; Rec."ProfitLossScenario1B") { }
                field("ProfitLossScenario2A"; Rec."ProfitLossScenario2A") { }
                field("ProfitLossScenario2B"; Rec."ProfitLossScenario2B") { }
                field("ProfitLossScenario3"; Rec."ProfitLossScenario3") { }
                field("ProfitLossScenario4"; Rec."ProfitLossScenario4") { }
            }
        }
    }
}
