page 50100 "Current Derivatives Inputs"
{
    PageType = List;
    SourceTable = "CurrentDerivativesInputs";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No") { }
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
                field("Scenario1A_Increase"; Rec."Scenario1A_Increase") { }
                field("Scenario1B_Increase"; Rec."Scenario1B_Increase") { }
                field("Scenario2A_Decrease"; Rec."Scenario2A_Decrease") { }
                field("Scenario2B_Decrease"; Rec."Scenario2B_Decrease") { }
                field("Scenario3PriceMax"; Rec."Scenario3PriceMax") { }
                field("Scenario4PriceMin"; Rec."Scenario4PriceMin") { }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ImportData)
            {
                Caption = 'Import Data';
                Image = Import;
                trigger OnAction()
                begin
                    Message('Implement file import logic here.');
                end;
            }
        }
    }
}
