page 70156 "Client Level P&L OutPut List"
{
    PageType = List;
    SourceTable = "Client Level P&L OutPut";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Client Level P&L OutPut List';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("CmCode"; Rec."CmCode") { ApplicationArea = All; }
                field("TmCode"; Rec."TmCode") { ApplicationArea = All; }
                field("ClientCode"; Rec."ClientCode") { ApplicationArea = All; }

                field("Profit/Loss Scenario1A"; Rec."Profit/Loss Scenario1A") { ApplicationArea = All; }
                field("Profit/Loss Scenario1B"; Rec."Profit/Loss Scenario1B") { ApplicationArea = All; }
                field("Profit/Loss Scenario2A"; Rec."Profit/Loss Scenario2A") { ApplicationArea = All; }
                field("Profit/Loss Scenario2B"; Rec."Profit/Loss Scenario2B") { ApplicationArea = All; }
                field("Profit/Loss Scenario3"; Rec."Profit/Loss Scenario3") { ApplicationArea = All; }
                field("Profit/Loss Scenario4"; Rec."Profit/Loss Scenario4") { ApplicationArea = All; }

                field("Margin"; Rec."Margin") { ApplicationArea = All; }


                field("NetLoss Scenario1A"; Rec."NetLoss Scenario1A") { ApplicationArea = All; }
                field("NetLoss Scenario1B"; Rec."NetLoss Scenario1B") { ApplicationArea = All; }
                field("NetLoss Scenario2A"; Rec."NetLoss Scenario2A") { ApplicationArea = All; }
                field("NetLoss Scenario2B"; Rec."NetLoss Scenario2B") { ApplicationArea = All; }
                field("NetLoss Scenario3"; Rec."NetLoss Scenario3") { ApplicationArea = All; }
                field("NetLoss Scenario4"; Rec."NetLoss Scenario4") { ApplicationArea = All; }
                field("NetLoss (-) OnScenario1A"; Rec."NetLoss (-) OnScenario1A") { ApplicationArea = All; }
                field("NetLoss (-) OnScenario1B"; Rec."NetLoss (-) OnScenario1B") { ApplicationArea = All; }

                field("NetLoss (-) OnScenario2A"; Rec."NetLoss (-) OnScenario2A") { ApplicationArea = All; }
                field("NetLoss (-) OnScenario2b"; Rec."NetLoss (-) OnScenario2b") { ApplicationArea = All; }
                field("NetLoss (-) OnScenario3"; Rec."NetLoss (-) OnScenario3") { ApplicationArea = All; }
                field("NetLoss (-) OnScenario4"; Rec."NetLoss (-) OnScenario4") { ApplicationArea = All; }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Run P&L Report")
            // {
            //     Caption = 'Run Client P&L Report';
            //     ApplicationArea = All;
            //     trigger OnAction()
            //     begin
            //         Report.Run(70154, false, false); // Your existing P&L generation report
            //     end;
            // }
        }
    }
}
