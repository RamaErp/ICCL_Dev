page 70157 "CM Final Loss On Scenario"
{
    PageType = List;
    SourceTable = "CMFinalLossOnScenario_New";
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'CM Final Loss On Scenario';

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { ApplicationArea = All; }
                field("CmCode"; Rec."CmCode") { ApplicationArea = All; }
                //  field("TmCode"; Rec."TmCode") { ApplicationArea = All; }
                //field("ClientCode"; Rec."ClientCode") { ApplicationArea = All; }
                //field("Margin"; Rec."Margin") { ApplicationArea = All; }

                field("FundsPayInPreDay"; Rec."FundsPayInPreDay") { ApplicationArea = All; }
                field("FundsPayOutPreDay"; Rec."FundsPayOutPreDay") { ApplicationArea = All; }
                field("FundsPayInAtEODPrice"; Rec."FundsPayInAtEODPrice") { ApplicationArea = All; }
                field("FundsPayOutAtEODPrice"; Rec."FundsPayOutAtEODPrice") { ApplicationArea = All; }
                field(ProprietaryMarginRTRMS; Rec.ProprietaryMarginRTRMS) { ApplicationArea = All; }

            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Export to Excel")
            // {
            //     Caption = 'Export to Excel';
            //     ApplicationArea = All;
            //     trigger OnAction()
            //     begin
            //         Message('Implement Excel export logic here.');
            //         // Optional: link to Excel Buffer export pattern or trigger a report
            //     end;
            // }
        }
    }
}
