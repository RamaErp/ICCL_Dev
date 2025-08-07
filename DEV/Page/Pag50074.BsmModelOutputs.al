page 50074 "BSM Model Pricing Output List"
{
    PageType = List;
    SourceTable = "BSM Model Pricing Uotput";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sr. No."; Rec."Sr. No.") { }
                field("Report Date"; Rec."Report Date") { }
                field("Expiry Date"; Rec."Expiry Date") { }
                field("Series ID"; Rec."Series ID") { }
                field("Call Put"; Rec."Call Put") { }
                field("Asset Code"; Rec."Asset Code") { }
                field("Actual Spot Rate"; Rec."Actual Spot Rate") { }
                field("Revised Spot Rate S1"; Rec."Revised Spot Rate S1") { }
                field("Revised Spot Rate S2"; Rec."Revised Spot Rate S2") { }
                field("Revised Spot Rate S3"; Rec."Revised Spot Rate S3") { }
                field("Revised Spot Rate S4"; Rec."Revised Spot Rate S4") { }
                field("Strike Rate"; Rec."Strike Rate") { }
                field("Time to Expiration"; Rec."Time to Expiration") { }
                field("Rate"; Rec."Rate") { }
                field("Volatility (v)"; Rec."Volatility (v)") { }
                field("d1 SC1A"; Rec."d1 SC1A") { }
                field("d2 SC1A"; Rec."d2 SC1A") { }
                field("Call Price SC1A"; Rec."Call Price SC1A") { }
                field("Put Price SC1A"; Rec."Put Price SC1A") { }
                field("d1 SC1B"; Rec."d1 SC1B") { }
                field("d2 SC1B"; Rec."d2 SC1B") { }
                field("Call Price SC1B"; Rec."Call Price SC1B") { }
                field("Put Price SC1B"; Rec."Put Price SC1B") { }
                field("d1 SC2A"; Rec."d1 SC2A") { }
                field("d2 SC2A"; Rec."d2 SC2A") { }
                field("Call Price SC2A"; Rec."Call Price SC2A") { }
                field("Put Price SC2A"; Rec."Put Price SC2A") { }
                field("d1 SC2B"; Rec."d1 SC2B") { }
                field("d2 SC2B"; Rec."d2 SC2B") { }
                field("Call Price SC2B"; Rec."Call Price SC2B") { }
                field("Put Price SC2B"; Rec."Put Price SC2B") { }
                field("Future Price SC1A"; Rec."Future Price SC1A") { }
                field("Future Price SC1B"; Rec."Future Price SC1B") { }
                field("Future Price SC2A"; Rec."Future Price SC2A") { }
                field("Future Price SC2B"; Rec."Future Price SC2B") { }
                field(Scenario3PriceMax; Rec.Scenario3PriceMax) { }
                field(Scenario4PriceMax; Rec.Scenario4PriceMax) { }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            // group(Processing)
            // {
            //     action(EditList)
            //     {
            //         Caption = 'Edit List';
            //         Image = EditLines;
            //         RunObject = page 70125; // You can replace this with a card page ID
            //         RunPageMode = Edit;
            //     }
            // }
        }
    }
}
