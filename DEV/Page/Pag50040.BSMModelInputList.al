page 70101 "Option Pricing Input List"
{
    PageType = List;
    SourceTable = "Option Pricing Input";
    Caption = 'BSM Model Pricing Input List';
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Trade Date"; Rec."Report Date")
                {
                    ApplicationArea = All;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = All;
                }
                field("Series ID"; Rec."Series ID")
                {
                    ApplicationArea = All;
                }
                field("Option Type"; Rec."Option Type")
                {
                    ApplicationArea = All;
                }
                field("Asset Code"; Rec."Asset Code")
                {
                    ApplicationArea = All;
                }
                field("Actual Spot Rate"; Rec."Actual Spot Rate")
                {
                    ApplicationArea = All;
                }
                field("Strike Rate (X)"; Rec."Strike Rate (X)")
                {
                    ApplicationArea = All;
                }
                field("Time to Expiration (T)"; Rec."Time to Expiration (T)")
                {
                    ApplicationArea = All;
                }
                field("Interest Rate (r)"; Rec."Interest Rate (r)")
                {
                    ApplicationArea = All;
                }
                field("Volatility (v)"; Rec."Volatility (v)")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // Add custom actions if needed
        }
    }


    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        Days: Integer;
    begin
        Days := Rec."Expiry Date" - Rec."Report Date";
        if Days < 0 then
            Rec."Time to Expiration (T)" := 0
        else
            Rec."Time to Expiration (T)" := Days / 365;
        Rec."Time to Expiration (T)" := Round(Rec."Time to Expiration (T)", 0.000001);
        Rec.Modify();
    end;
}
