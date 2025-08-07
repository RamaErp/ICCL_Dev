page 70153 "ClientSeriesLvlProfitLossList"
{
    PageType = List;
    Caption = 'Client Series Level Profit Loss input List';
    SourceTable = "ClientSeriesLevelProfitLoss";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { }
                field("CmCode"; Rec."CmCode") { }
                field("TmCode"; Rec."TmCode") { }
                field("ClientCode"; Rec."ClientCode") { }
                field("ProductType"; Rec."ProductType") { }
                field("SeriesId"; Rec."SeriesId") { }
                field("StrikePrice"; Rec."StrikePrice") { }
                field("CallPut"; Rec."CallPut") { }
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
                field("Scenario1AIncrease"; Rec."Scenario1AIncrease") { }
                field("Scenario1BIncrease"; Rec."Scenario1BIncrease") { }
                field("Scenario2ADecrease"; Rec."Scenario2ADecrease") { }
                field("Scenario2BDecrease"; Rec."Scenario2BDecrease") { }
                field("Scenario3PriceMax"; Rec."Scenario3PriceMax") { }
                field("Scenario4PriceMin"; Rec."Scenario4PriceMin") { }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Refresh Scenarios")
            {
                ApplicationArea = All;
                trigger OnAction()
                begin
                    // Add your logic here if you want to recalculate or refresh scenario values
                end;
            }
        }
    }
}
