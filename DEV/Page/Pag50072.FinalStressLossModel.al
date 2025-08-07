page 50072 "Final Stress Loss Model List"
{
    PageType = List;
    Caption = 'Final Stress Loss Model output List';
    SourceTable = FinalStressLossModel;
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sr. No."; Rec."Sr. No.") { }
                field("Cm Code"; Rec."Cm Code") { }
                field("Tm Code"; Rec."Tm Code") { }
                field("Client Code"; Rec."Client Code") { }
                field("Product Type"; Rec."Product Type") { }
                field("Series Id"; Rec."Series Id") { }
                field("Strike Price"; Rec."Strike Price") { }
                field("Call/Put"; Rec."Call/Put") { }
                field("Asset Code"; Rec."Asset Code") { }
                field("Series Code"; Rec."Series Code") { }
                field("Market Lot"; Rec."Market Lot") { }
                field("Underlying Id"; Rec."Underlying Id") { }
                field("Pre Day Close Price"; Rec."Pre Day Close Price") { }
                field("Today Close Price"; Rec."Today Close Price") { }
                field("CP Code"; Rec."CP Code") { }
                field("Net Qty"; Rec."Net Qty") { }
                field("Net Value"; Rec."Net Value") { }
                field("Net Value on Today Close Price"; Rec."Net Value on Today Close Price") { }

                field("Scenario 1A (Increase)"; Rec."Scenario 1A (Increase)") { }
                field("Scenario 1B (Increase)"; Rec."Scenario 1B (Increase)") { }
                field("Scenario 2A (Decrease)"; Rec."Scenario 2A (Decrease)") { }
                field("Scenario 2B (Decrease)"; Rec."Scenario 2B (Decrease)") { }
                field("Scenario 3 Price Max"; Rec."Scenario 3 Price Max") { }
                field("Scenario 4 Price Max"; Rec."Scenario 4 Price Max") { }

                field("Net Value on Scenario 1A"; Rec."Net Value on Scenario 1A") { }
                field("Net Value on Scenario 1B"; Rec."Net Value on Scenario 1B") { }
                field("Net Value on Scenario 2A"; Rec."Net Value on Scenario 2A") { }
                field("Net Value on Scenario 2B"; Rec."Net Value on Scenario 2B") { }
                field("Net Value on Scenario 3"; Rec."Net Value on Scenario 3") { }
                field("Net Value on Scenario 4"; Rec."Net Value on Scenario 4") { }

                field("Profit/Loss on Scenario 1A"; Rec."Profit/Loss on Scenario 1A") { }
                field("Profit/Loss on Scenario 1B"; Rec."Profit/Loss on Scenario 1B") { }
                field("Profit/Loss on Scenario 2A"; Rec."Profit/Loss on Scenario 2A") { }
                field("Profit/Loss on Scenario 2B"; Rec."Profit/Loss on Scenario 2B") { }
                field("Profit/Loss on Scenario 3"; Rec."Profit/Loss on Scenario 3") { }
                field("Profit/Loss on Scenario 4"; Rec."Profit/Loss on Scenario 4") { }
            }
        }
    }
}
