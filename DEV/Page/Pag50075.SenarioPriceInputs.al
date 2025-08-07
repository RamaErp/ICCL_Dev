page 50075 "Scenario Price Input List"
{
    PageType = List;
    SourceTable = "Senario Price Input";
    Caption = 'Scenario Price Input List';
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
                field("Report Date"; Rec."Report Date")
                {
                    ApplicationArea = All;
                }
                field("Asset Token No."; Rec."Asset Token No.")
                {
                    ApplicationArea = All;
                }
                field("Symbol / Asset Code"; Rec."Symbol / Asset Code")
                {
                    ApplicationArea = All;
                }
                field("Standard Deviation (0.995)"; Rec."Standard Deviation (0.995)")
                {
                    ApplicationArea = All;
                }
                field("Standard Deviation (0.94)"; Rec."Standard Deviation (0.94)")
                {
                    ApplicationArea = All;
                }
                field(PSR; Rec.PSR)
                {
                    ApplicationArea = All;
                }
                field("Sigma Scaling factor"; Rec."Sigma Scaling factor")
                {
                    ApplicationArea = All;
                }
                field(MPOR; Rec.MPOR)
                {
                    ApplicationArea = All;
                }
                field(CovertedUnderlyingprice; Rec.CovertedUnderlyingprice)
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
            // You can define custom actions here
        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
        EQDfull: Record EQD_FullSp;
        "EWMA": Record "EWMA";
    begin
        EQDfull.Reset();
        EQDfull.SetRange("Asset Token No.", Rec."Asset Token No.");
        if EQDfull.FindFirst() then begin
            // Rec."Symbol / Asset Code" := EQDfull."Series Code";
            Rec."CovertedUnderlyingprice" := EQDfull."Contarct Underline Price" / 100;
            Rec.Modify();
            // end else begin
            //     //Rec."Symbol / Asset Code" := '';
            //     Rec."CovertedUnderlyingprice" := 0;
        end;
        "EWMA".Reset();
        "EWMA".SetRange("Asset Token No.", Rec."Asset Token No.");
        "EWMA".SetRange("Symbol / Asset Code", Rec."Symbol / Asset Code");
        if "EWMA".FindFirst() then begin
            Rec."Standard Deviation (0.995)" := "EWMA"."Std Dev (0.995)";
            Rec."Standard Deviation (0.94)" := "EWMA"."Std Dev (0.94)";
            Rec.Modify();
        end else begin
            Rec."Standard Deviation (0.995)" := 0;
            Rec."Standard Deviation (0.94)" := 0;
            Rec.Modify();
        end;
    end;
}
