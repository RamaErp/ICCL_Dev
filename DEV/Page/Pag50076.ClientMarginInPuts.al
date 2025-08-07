page 50076 "Client Margin Input List"
{
    PageType = List;
    SourceTable = "Client Margin Inputs";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("CmCode"; Rec."CmCode") { }
                field("TmCode"; Rec."TmCode") { }
                field("ClientCode"; Rec."ClientCode") { }
                field("Margin"; Rec."Margin") { }
                field(FundsPayInPreDay; Rec.FundsPayInPreDay) { }
                field(FundsPayOutPreDay; Rec.FundsPayOutPreDay) { }
                field(FundsPayInAtEODPrice; Rec.FundsPayInAtEODPrice) { }
                field(FundsPayOutAtEODPrice; Rec.FundsPayOutAtEODPrice) { }
            }
        }
    }
}
