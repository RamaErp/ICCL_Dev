page 70251 "CD_CMFinalLossScenario"
{
    PageType = List;
    SourceTable = "CD_CMFinalLossScenario";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CmCode"; Rec."CmCode") { }

                field(TmCode; Rec.TmCode) { }
                field("FundsPayInPreDay"; Rec."FundsPayInPreDay") { }
                field("FundsPayOutPreDay"; Rec."FundsPayOutPreDay") { }

                field("FundsPayInAtEODPrice"; Rec."FundsPayInAtEODPrice") { }
                field("FundsPayOutAtEODPrice"; Rec."FundsPayOutAtEODPrice") { }
                field(ProprietaryMarginRTRMS; Rec.ProprietaryMarginRTRMS) { }
            }
        }
    }
}
