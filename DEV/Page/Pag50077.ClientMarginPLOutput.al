page 50102 "Client Margin P&L Output List"
{
    PageType = List;
    SourceTable = "Client Margin P&L Outputs";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("SrNo"; Rec."SrNo") { }
                field("CmCode"; Rec."CmCode") { }
                field("TmCode"; Rec."TmCode") { }
                field("ClientCode"; Rec."ClientCode") { }
                field("Scenario1A"; Rec."Scenario1A") { }
                field("Scenario1B"; Rec."Scenario1B") { }
                field("Scenario2A"; Rec."Scenario2A") { }
                field("Scenario2B"; Rec."Scenario2B") { }
                field("Scenario3"; Rec."Scenario3") { }
                field("Scenario4"; Rec."Scenario4") { }
            }
        }
    }
}
