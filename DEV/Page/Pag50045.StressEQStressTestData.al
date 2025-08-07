// page 50045 Stress_EQ_StressTestData
// {
//     ApplicationArea = All;
//     Caption = 'Stress_EQ_StressTestData';
//     PageType = List;
//     SourceTable = vwSTRESS_EQ_StressTestData;
//     UsageCategory = Lists;

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 field("Entry No."; Rec."Entry No.")
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
//                 }
//                 field(TMCode; Rec.TMCode)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TMCode field.', Comment = '%';
//                 }
//                 field(DataSource; Rec.DataSource)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the DataSource field.', Comment = '%';
//                 }
//                 field(MemberCode; Rec.MemberCode)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the MemberCode field.', Comment = '%';
//                 }
//                 field(ScripCode; Rec.ScripCode)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the ScripCode field.', Comment = '%';
//                 }
//                 field(SettNo; Rec.SettNo)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SettNo field.', Comment = '%';
//                 }
//                 field(StressTestDate; Rec.StressTestDate)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the StressTestDate field.', Comment = '%';
//                 }
//                 field(ClosingPrice; Rec.ClosingPrice)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the ClosingPrice field.', Comment = '%';
//                 }
//                 field(CustOblBuyForMember; Rec.CustOblBuyForMember)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the CustOblBuyForMember field.', Comment = '%';
//                 }
//                 field(CustOblSellForMember; Rec.CustOblSellForMember)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the CustOblSellForMember field.', Comment = '%';
//                 }
//                 field(FundsPayInFailLoss; Rec.FundsPayInFailLoss)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the FundsPayInFailLoss field.', Comment = '%';
//                 }
//                 field(GrossLoss; Rec.GrossLoss)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the GrossLoss field.', Comment = '%';
//                 }
//                 field(NetLoss; Rec.NetLoss)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the NetLoss field.', Comment = '%';
//                 }
//                 field(RequiredMargin; Rec.RequiredMargin)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the RequiredMargin field.', Comment = '%';
//                 }
//                 field(RetailBuyQty; Rec.RetailBuyQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the RetailBuyQty field.', Comment = '%';
//                 }
//                 field(RetailSellQty; Rec.RetailSellQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the RetailSellQty field.', Comment = '%';
//                 }
//                 field(SecPayInFailLoss; Rec.SecPayInFailLoss)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SecPayInFailLoss field.', Comment = '%';
//                 }
//                 field(SecPayInQty; Rec.SecPayInQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SecPayInQty field.', Comment = '%';
//                 }
//                 field(SecPayOutQty; Rec.SecPayOutQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SecPayOutQty field.', Comment = '%';
//                 }
//                 field(SettType; Rec.SettType)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SettType field.', Comment = '%';
//                 }
//                 field(SystemId; Rec.SystemId)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SystemId field.', Comment = '%';
//                 }
//                 field(TotalBuyQty; Rec.TotalBuyQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalBuyQty field.', Comment = '%';
//                 }
//                 field(TotalBuyValue; Rec.TotalBuyValue)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalBuyValue field.', Comment = '%';
//                 }
//                 field(TotalBuyValueOnCP; Rec.TotalBuyValueOnCP)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalBuyValueOnCP field.', Comment = '%';
//                 }
//                 field(TotalCustRejectBuyQty; Rec.TotalCustRejectBuyQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalCustRejectBuyQty field.', Comment = '%';
//                 }
//                 field(TotalCustRejectBuyValue; Rec.TotalCustRejectBuyValue)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalCustRejectBuyValue field.', Comment = '%';
//                 }
//                 field(TotalCustRejectSellQty; Rec.TotalCustRejectSellQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalCustRejectSellQty field.', Comment = '%';
//                 }
//                 field(TotalCustRejectSellValue; Rec.TotalCustRejectSellValue)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalCustRejectSellValue field.', Comment = '%';
//                 }
//                 field(TotalFundsPayIn; Rec.TotalFundsPayIn)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalFundsPayIn field.', Comment = '%';
//                 }
//                 field(TotalFundsPayOut; Rec.TotalFundsPayOut)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalFundsPayOut field.', Comment = '%';
//                 }
//                 field(TotalSellQty; Rec.TotalSellQty)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalSellQty field.', Comment = '%';
//                 }
//                 field(TotalSellValue; Rec.TotalSellValue)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalSellValue field.', Comment = '%';
//                 }
//                 field(TotalSellValueOnCP; Rec.TotalSellValueOnCP)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the TotalSellValueOnCP field.', Comment = '%';
//                 }
//                 field(SystemCreatedAt; Rec.SystemCreatedAt)
//                 {
//                     ApplicationArea = all;
//                     ToolTip = 'Specifies the value of the SystemCreatedAt field.', Comment = '%';
//                 }
//             }
//         }
//     }
// }
