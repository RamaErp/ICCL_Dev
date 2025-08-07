page 50042 EDX_BC
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = EDX_BC;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Report Date"; Rec."Report Date")
                {
                    ApplicationArea = all;
                }
                field(AssetCode; Rec.AssetCode)
                {
                    ApplicationArea = all;
                }
                field(Symbol; Rec.Symbol)
                {
                    ApplicationArea = all;
                }
                field("Standard Deviation (0.995)"; Rec."Standard Deviation (0.995)")
                {
                    ApplicationArea = all;
                }
                field("Standard Deviation (0.94)"; Rec."Standard Deviation (0.94)")
                {
                    ApplicationArea = all;
                }
                field(ClosingDate; Rec.ClosingDate)
                {
                    ApplicationArea = all;
                }
                field("Series ID"; Rec."Series ID")
                {
                    ApplicationArea = all;
                }
                field("Series Name"; Rec."Series Name")
                {
                    ApplicationArea = all;
                }
                field(CommonClosePrice; Rec.CommonClosePrice)
                {
                    ApplicationArea = all;
                }
                field(CommonUnderLyingClosePrice; Rec.CommonUnderLyingClosePrice)
                {
                    ApplicationArea = all;
                }
                field(PSR; Rec.PSR)
                {
                    ApplicationArea = all;
                }
                field("Sigma Scaling factor"; Rec."Sigma Scaling factor")
                {
                    ApplicationArea = all;
                }
                field(MPOR; Rec.MPOR)
                {
                    ApplicationArea = all;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = all;
                }
                field(Expiry; Rec.Expiry)
                {
                    ApplicationArea = all;
                }
                // field("Series ID"; Rec."Series ID")
                // {
                //     ApplicationArea = all;
                // }
                field(CallPut; Rec.CallPut)
                {
                    ApplicationArea = all;
                }
                field("Asset Token No."; Rec."Asset Token No.")
                {
                    ApplicationArea = all;
                }
                field(Strikerate; Rec.Strikerate)
                {
                    ApplicationArea = all;
                }
                field(TimeToExpiration; Rec.TimeToExpiration)
                {
                    ApplicationArea = all;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = all;
                }
                field(Volatility; Rec.Volatility)
                {
                    ApplicationArea = all;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

                trigger OnAction()
                begin

                end;
            }
        }
    }
}