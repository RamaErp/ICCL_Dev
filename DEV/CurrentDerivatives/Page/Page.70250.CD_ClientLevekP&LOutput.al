page 70250 "CD_ClientLevelP&LOutputList"
{
    PageType = List;
    SourceTable = "CD_Client Level P&L Output";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sr. No"; Rec."Sr. No") { }
                field("CmCode"; Rec."CmCode") { }
                field("TmCode"; Rec."TmCode") { }
                field("Client Code"; Rec."Client Code") { }

                field("Profit On Scenario1A"; Rec."Profit On Scenario1A") { }
                field("Profit On Scenario1B"; Rec."Profit On Scenario1B") { }
                field("Profit On Scenario2A"; Rec."Profit On Scenario2A") { }
                field("Profit On Scenario2B"; Rec."Profit On Scenario2B") { }
                field("Profit On Scenario3"; Rec."Profit On Scenario3") { }
                field("Profit On Scenario4"; Rec."Profit On Scenario4") { }

                field("Margin"; Rec."Margin") { }

                field("NetLoss On Scenario1A"; Rec."NetLoss On Scenario1A") { }
                field("NetLoss On Scenario1B"; Rec."NetLoss On Scenario1B") { }
                field("NetLoss On Scenario2A"; Rec."NetLoss On Scenario2A") { }
                field("NetLoss On Scenario2B"; Rec."NetLoss On Scenario2B") { }
                field("NetLoss On Scenario3"; Rec."NetLoss On Scenario3") { }
                field("NetLoss On Scenario4"; Rec."NetLoss On Scenario4") { }
            }
        }
    }
}
