// report 50054 "BSM Model_ Pricing"
// {
//     UsageCategory = ReportsAndAnalysis;
//     ApplicationArea = All;
//     ProcessingOnly = true;

//     dataset
//     {
//         dataitem("Option Pricing Input"; "Option Pricing Input")
//         {

//             trigger OnPreDataItem()
//             var
//                 myInt: Integer;
//             begin

//                 //EDX_BC.SetFilter("Report Date", '%1..%2', FromDate, ToDate);
//                 Sr := 0;
//                 ExcelBuffer.NewRow();
//                 ExcelBuffer.AddColumn('Sr.No', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Report Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Expiry Date', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Series ID', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Put', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Asset Code', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Actual Spot Rate', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Revised Spot Rate * (Price pulled from "Scenario Price" excel "INPUT" sheet)', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(' ', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Strike Rate', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Time to Expiration', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Rate', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('"Option Pricing Input"."Volatility (v)"', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('d2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      SC2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('      Future Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

//                 ExcelBuffer.NewRow();
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     S4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     X', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     T', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     R', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     V', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Call Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('Put Price', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn('     SC2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.NewRow();
//             end;

//             trigger OnAfterGetRecord()
//             var
//             // myInt: Integer;
//             // Sen: Decimal;
//             // Sen1: Decimal;
//             // Sen2: Decimal;
//             // Sen3: Decimal;
//             // Sen4: Decimal;
//             // Sen5: Decimal;
//             // Sen6: Decimal;
//             // Sen7: Decimal;
//             // scenario12: Decimal;
//             // SenPrice1: Decimal;
//             // SenPrice2: Decimal;
//             // SenPrice3: Decimal;
//             // SenPrice4: Decimal;
//             // DayDifference: Integer;
//             // timetoExpiration: Decimal;
//             // lnValue: Decimal;
//             // lnValue1: Decimal;
//             // lnValue2: Decimal;
//             // lnValue3: Decimal;
//             // lnValue4: Decimal;
//             // lnValue5: Decimal;
//             // lnValue6: Decimal;
//             // lnValue7: Decimal;
//             // lnValue8: Decimal;
//             // ValueD2: Decimal;
//             // ValueD21: Decimal;
//             // ValueD22: Decimal;
//             // SC1ACellPrice: Decimal;
//             // SC1ACellPrice1: Decimal;
//             // SC1ACellPrice2: Decimal;
//             // SC1ACellPrice3: Decimal;
//             // EDX_BC: Record "Senario Price Input";
//             begin
//                 Sr += 1;
//                 Clear(timetoExpiration);
//                 Clear(scenarioPrice1);
//                 Clear(scenarioPrice2);
//                 Clear(scenarioPrice5);
//                 Clear(scenarioPrice6);
//                 Clear(scenarioPrice1);
//                 Clear(scenarioPrice2);
//                 Clear(scenarioPrice5);
//                 Clear(scenarioPrice6);
//                 Clear(scenario1);
//                 Clear(scenario2);
//                 Clear(scenario5);
//                 Clear(scenario6);
//                 Clear(Sen);
//                 Clear(Sen1);
//                 EDX_BC.Reset();
//                 EDX_BC.SetRange("Symbol / Asset Code", "Asset Code");
//                 if EDX_BC.FindFirst() then begin
//                     Sen := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                     sen1 := EDX_BC."Standard Deviation (0.94)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                     // scenario12 := (Sen + sen1) * 100;
//                     scenario1 := Round((Sen + sen1) * 100, 0.00000100);

//                     Clear(Sen2);
//                     Clear(Sen3);
//                     Sen2 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                     Sen3 := EDX_BC."Standard Deviation (0.995)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                     scenario2 := Round((Sen2 + sen3) * 100, 0.00000100);

//                     Clear(Sen4);
//                     Clear(Sen5);
//                     Sen4 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                     sen5 := EDX_BC."Standard Deviation (0.94)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                     scenario5 := Round((Sen4 + sen5) * 100 * -1, 0.00000100);
//                     Clear(Sen6);
//                     Clear(Sen7);
//                     Sen6 := EDX_BC."Standard Deviation (0.995)" * EDX_BC.PSR * Power(EDX_BC.MPOR, 1 / 2);
//                     Sen7 := EDX_BC."Standard Deviation (0.995)" * EDX_BC."Sigma Scaling factor" * Power(EDX_BC.MPOR, 1 / 2);
//                     scenario6 := Round((Sen6 + sen7) * 100 * -1, 0.00000100);


//                     Clear(ContractUnderlinePrice);
//                     //EQDFullSp.Reset();
//                     //  EQDFullSp.SetRange("Asset Token No.", EDX_BC."Asset Token No.");
//                     // if EQDFullSp.FindFirst() then begin
//                     ContractUnderlinePrice := Round(EDX_BC.CovertedUnderlyingprice / 100, 0.00100);
//                     // end;
//                     Clear(SenPrice1);
//                     Clear(SenPrice2);
//                     Clear(SenPrice3);
//                     Clear(SenPrice4);
//                     SenPrice1 := EDX_BC.CovertedUnderlyingprice * scenario1;
//                     SenPrice2 := EDX_BC.CovertedUnderlyingprice * scenario2;
//                     SenPrice3 := EDX_BC.CovertedUnderlyingprice * scenario5;
//                     SenPrice4 := EDX_BC.CovertedUnderlyingprice * scenario6;
//                     scenarioPrice1 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice1 / 100, 0.01);
//                     scenarioPrice2 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice2 / 100, 0.01);
//                     scenarioPrice5 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice3 / 100, 0.01);
//                     scenarioPrice6 := Round(EDX_BC.CovertedUnderlyingprice + SenPrice4 / 100, 0.01);



//                     //DayDifference := EDX_BC.Expiry - EDX_BC."Report Date";
//                     timetoExpiration := DayDifference / 365;
//                     //  lnValue := Logarithm(2, 10);                
//                     // lnValue1 := CalculateLn(434.85 / 340.00); /// (0.240190407)
//                     // lnValue6 := 7 + (0.52488900 * 0.52488900) / 2; ///(0.1377542312)
//                     // lnValue2 := lnValue6 * "Option Pricing Input"."Time to Expiration (T)";
//                     // lnValue3 := lnValue1 + lnValue2;
//                     // lnValue4 := 0.524889 * Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2);
//                     // lnValue5 := lnValue3 / lnValue4;
//                     Clear(lnValue);
//                     Clear(lnValue1);
//                     Clear(lnValue2);
//                     Clear(lnValue3);
//                     Clear(lnValue4);
//                     Clear(lnValue5);
//                     Clear(lnValue6);
//                     Clear(lnValue7);
//                     Clear(lnValue8);
//                     Clear(ValueD2);
//                     Clear(ValueD21);
//                     Clear(lnValueS2d1);
//                     Clear(lnValue1S2d1);
//                     Clear(lnValue2S2d1);
//                     Clear(lnValue3S2d1);
//                     Clear(lnValue4S2d1);
//                     Clear(lnValue5S2d1);
//                     Clear(lnValue6S2d1);
//                     Clear(lnValue7S2d1);
//                     Clear(lnValue8S2d1);
//                     Clear(ValueD2S2d2);
//                     Clear(ValueD21S2d2);
//                     Clear(lnValueS2Ad1);
//                     Clear(lnValue1S2Ad1);
//                     Clear(lnValue2S2Ad1);
//                     Clear(lnValue3S2Ad1);
//                     Clear(lnValue4S2Ad1);
//                     Clear(lnValue5S2Ad1);
//                     Clear(lnValue6S2Ad1);
//                     Clear(lnValue7S2Ad1);
//                     Clear(lnValue8S2Ad1);
//                     Clear(ValueD2S2Ad2);
//                     Clear(ValueD21S2Ad2);
//                     Clear(lnValueS2Bd1);
//                     Clear(lnValue1S2Bd1);
//                     Clear(lnValue2S2Bd1);
//                     Clear(lnValue3S2Bd1);
//                     Clear(lnValue4S2Bd1);
//                     Clear(lnValue5S2Bd1);
//                     Clear(lnValue6S2Bd1);
//                     Clear(lnValue7S2Bd1);
//                     Clear(lnValue8S2Bd1);
//                     Clear(ValueD2S2Bd2);
//                     Clear(ValueD21S2Bd2);
//                     Clear(SC1ACallPrice1);
//                     Clear(SC1ACallPrice11);
//                     Clear(SC1ACallPrice2);
//                     Clear(SC1ACallPrice3);
//                     Clear(SC1ACallPrice4);
//                     Clear(SC1APUTPrice11);
//                     Clear(SC1APUTPrice1);
//                     Clear(SC1APUTPrice2);
//                     Clear(SC1APUTPrice3);
//                     Clear(SC1APUTPrice4);
//                     Clear(SC2A1CallPrice1);
//                     Clear(SC2A1CallPrice11);
//                     Clear(SC2A1CallPrice2);
//                     Clear(SC2A1CallPrice3);
//                     Clear(SC2A1CallPrice4);
//                     Clear(SC2A1PUTPrice11);
//                     Clear(SC2A1PUTPrice1);
//                     Clear(SC2A1PUTPrice2);
//                     Clear(SC2A1PUTPrice3);
//                     Clear(SC2A1PUTPrice4);
//                     Clear(SC2BCallPrice1);
//                     Clear(SC2BCallPrice11);
//                     Clear(SC2BCallPrice2);
//                     Clear(SC2BCallPrice3);
//                     Clear(SC2BCallPrice4);
//                     Clear(SC2BPUTPrice11);
//                     Clear(SC2BPUTPrice1);
//                     Clear(SC2BPUTPrice2);
//                     Clear(SC2BPUTPrice3);
//                     Clear(SC2BPUTPrice4);
//                     Clear(SC2ACallPrice1);
//                     Clear(SC2ACallPrice11);
//                     Clear(SC2ACallPrice2);
//                     Clear(SC2ACallPrice3);
//                     Clear(SC2ACallPrice4);
//                     Clear(SC2ACallPrice4);
//                     Clear(SC2APUTPrice11);
//                     Clear(SC2APUTPrice1);
//                     Clear(SC2APUTPrice2);
//                     Clear(SC2APUTPrice3);
//                     Clear(SC2APUTPrice4);
//                     Clear(FPSC1A);
//                     Clear(FPSC1A);
//                     Clear(FPSC2A);
//                     Clear(FPSC2B);
//                     if "Option Pricing Input"."Strike Rate (X)" <> 0 then begin
//                         // if DayDifference <> 0 then begin
//                         //     lnValue := 0.52488900 * 0.52488900;
//                         //     lnValue1 := lnValue / 2;
//                         //     lnValue2 := lnValue1 * 100;
//                         //     lnValue3 := Round(lnValue2 + 7, 0.01);
//                         //     lnValue4 := lnValue3 * DayDifference;
//                         //     lnValue8 := lnValue4 / 100;
//                         //     lnValue5 := CalculateLn(434.85 / 340.00) + lnValue8;
//                         //     lnValue6 := Power(DayDifference, 1 / 2) * 0.52488900;
//                         //     lnValue7 := lnValue5 / lnValue6;
//                         // end;

//                         // ValueD2 := Power(DayDifference, 1 / 2) * 0.52488900;
//                         // ValueD21 := lnValue7 - ValueD2;

//                         // lnValue := "Option Pricing Input"."Volatility (v)" * "Option Pricing Input"."Volatility (v)";
//                         // lnValue1 := lnValue / 2;
//                         // lnValue2 := lnValue1 * 100;
//                         // lnValue3 := Round(lnValue2 + 7);
//                         // lnValue4 := lnValue3 * "Option Pricing Input"."Time to Expiration (T)";
//                         // lnValue8 := lnValue4 / 100;
//                         // lnValue5 := CalculateLn(scenarioPrice1 / "Option Pricing Input"."Strike Rate (X)") + lnValue8;
//                         // lnValue6 := Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2) * "Option Pricing Input"."Volatility (v)";
//                         // // if lnValue6 <>
//                         // lnValue7 := Round((lnValue5 / lnValue6), 0.00005);
//                         // // if "Option Pricing Input"."Strike Rate (X)" <> 0 then
//                         // //     lnValue7 := CalculateCustomFormula(scenarioPrice1, "Option Pricing Input"."Strike Rate (X)", 7.00, "Option Pricing Input"."Volatility (v)", "Option Pricing Input"."Time to Expiration (T)");

//                         // ValueD2 := Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2) * "Option Pricing Input"."Volatility (v)";
//                         // ValueD21 := Round((lnValue7 - ValueD2), 0.00005);
//                         lnValue := Power("Option Pricing Input"."Volatility (v)", 2) / 2;
//                         ///lnValue1 := lnValue / 2;
//                        // lnValue2 := lnValue1 * 100;
//                         lnValue3 := lnValue + 7 / 100;
//                         lnValue4 := "Option Pricing Input"."Time to Expiration (T)" * lnValue3;
//                         //lnValue8 := lnValue4 / 100;
//                         lnValue5 := math.Log(scenarioPrice1 / "Option Pricing Input"."Strike Rate (X)") + lnValue4;
//                         lnValue6 := "Option Pricing Input"."Volatility (v)" * math.Sqrt("Option Pricing Input"."Time to Expiration (T)");
//                         // if lnValue6 <>
//                         lnValue7 := lnValue5 / lnValue6;
//                         // if "Option Pricing Input"."Strike Rate (X)" <> 0 then
//                         //     lnValue7 := CalculateCustomFormula(scenarioPrice1, "Option Pricing Input"."Strike Rate (X)", 7.00, "Option Pricing Input"."Volatility (v)", "Option Pricing Input"."Time to Expiration (T)");

//                         ValueD2 := Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2) * "Option Pricing Input"."Volatility (v)";
//                         ValueD21 := lnValue7 - ValueD2;


//                         //Clear(ValueD21S2d2);
//                         lnValueS2d1 := Power("Option Pricing Input"."Volatility (v)", 2) / 2;
//                         //lnValue1S2d1 := lnValueS2d1 / 2;
//                         //lnValue2S2d1 := lnValue1S2d1 * 100;
//                         lnValue3S2d1 := lnValue + 7 / 100;
//                         lnValue4S2d1 := "Option Pricing Input"."Time to Expiration (T)" * lnValue3S2d1;
//                         // lnValue8S2d1 := lnValue4S2d1 / 100;
//                         lnValue5S2d1 := math.Log(scenarioPrice2 / "Option Pricing Input"."Strike Rate (X)") + lnValue4S2d1;
//                         lnValue6S2d1 := "Option Pricing Input"."Volatility (v)" * math.Sqrt("Option Pricing Input"."Time to Expiration (T)");
//                         // if lnValue6 <>
//                         lnValue7S2d1 := lnValue5S2d1 / lnValue6S2d1;


//                         ValueD2S2d2 := Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2) * "Option Pricing Input"."Volatility (v)";
//                         ValueD21S2d2 := lnValue7S2d1 - ValueD2S2d2;

//                         // // SC1ACellPrice := 434.85 * NORMSDIST(1.77465) - 340.00;
//                         // // SC1ACellPrice1 := Exp(-7 * "Option Pricing Input"."Time to Expiration (T)" * NORMSDIST(1.62670));
//                         // // SC1ACellPrice2 := Round(SC1ACellPrice * SC1ACellPrice1, 0.05);
//                         // // SC1ACellPrice3 := MaxValue(SC1ACellPrice2, 0.05);


//                         //     lnValueS2Ad1 := "Option Pricing Input"."Volatility (v)" * "Option Pricing Input"."Volatility (v)";
//                         //     //lnValue1S2Ad1 := lnValueS2Ad1 / 2;
//                         //  ///   lnValue2S2Ad1 := lnValue1S2Ad1 * 100;
//                         //     lnValue3S2Ad1 := Round(lnValue2S2Ad1 + 7);
//                         //     lnValue4S2Ad1 := lnValue3S2Ad1 * "Option Pricing Input"."Time to Expiration (T)";
//                         //     lnValue8S2Ad1 := lnValue4S2Ad1 / 100;
//                         //     lnValue5S2Ad1 := CalculateLn(scenarioPrice5 / "Option Pricing Input"."Strike Rate (X)") + lnValue8S2Ad1;
//                         //     lnValue6S2Ad1 := Sqrt("Option Pricing Input"."Time to Expiration (T)") * "Option Pricing Input"."Volatility (v)";

//                         lnValueS2Ad1 := Power("Option Pricing Input"."Volatility (v)", 2) / 2;
//                         //lnValue1S2d1 := lnValueS2d1 / 2;
//                         //lnValue2S2d1 := lnValue1S2d1 * 100;
//                         lnValue3S2Ad1 := lnValueS2Ad1 + 7 / 100;
//                         lnValue4S2Ad1 := "Option Pricing Input"."Time to Expiration (T)" * lnValue3S2Ad1;
//                         // lnValue8S2d1 := lnValue4S2d1 / 100;
//                         lnValue5S2Ad1 := math.Log(scenarioPrice5 / "Option Pricing Input"."Strike Rate (X)") + lnValue4S2Ad1;
//                         lnValue6S2Ad1 := "Option Pricing Input"."Volatility (v)" * math.Sqrt("Option Pricing Input"."Time to Expiration (T)");
//                         // if lnValue6 <>

//                         // lnValue7S2Ad1Test := (lnValue5S2Ad1 / lnValue6S2Ad1);
//                         lnValue7S2Ad1 := lnValue5S2Ad1 / lnValue6S2Ad1;
//                         //  CalculateD1 :=(scenarioPrice5,"Option Pricing Input"."Strike Rate (X)", 7 / 100, "Option Pricing Input"."Volatility (v)", "Option Pricing Input"."Time to Expiration (T)");
//                         //lnValue6S2Ad1 := CalculateD1(scenarioPrice5, "Option Pricing Input"."Strike Rate (X)", 7 / 100, "Option Pricing Input"."Volatility (v)", "Option Pricing Input"."Time to Expiration (T)");


//                         ValueD2S2Ad2 := Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2) * "Option Pricing Input"."Volatility (v)";
//                         lnValue7S2Ad1Test1 := (lnValue7S2Ad1 - ValueD2S2Ad2);
//                         ValueD21S2Ad2 := Round((lnValue7S2Ad1 - ValueD2S2Ad2), 0.01);



//                         //Clear(ValueD21S2d2);
//                         // lnValueS2Bd1 := "Option Pricing Input"."Volatility (v)" * "Option Pricing Input"."Volatility (v)";
//                         // lnValue1S2Bd1 := lnValueS2Bd1 / 2;
//                         // lnValue2S2Bd1 := lnValue1S2Bd1 * 100;
//                         // lnValue3S2Bd1 := Round(lnValue2S2Bd1 + 7);
//                         // lnValue4S2Bd1 := lnValue3S2Bd1 * "Option Pricing Input"."Time to Expiration (T)";
//                         // lnValue8S2Bd1 := lnValue4S2Bd1 / 100;
//                         // lnValue5S2Bd1 := CalculateLn(scenarioPrice6 / "Option Pricing Input"."Strike Rate (X)") + lnValue8S2Bd1;
//                         // lnValue6S2Bd1 := Sqrt("Option Pricing Input"."Time to Expiration (T)") * "Option Pricing Input"."Volatility (v)";
//                         // // if lnValue6 <>
//                         // lnValue7S2Bd1 := Round(lnValue5S2Bd1 / lnValue6S2Bd1);

//                         lnValueS2Bd1 := Power("Option Pricing Input"."Volatility (v)", 2) / 2;
//                         //lnValue1S2d1 := lnValueS2d1 / 2;
//                         //lnValue2S2d1 := lnValue1S2d1 * 100;
//                         lnValue3S2Bd1 := lnValueS2Bd1 + 7 / 100;
//                         lnValue4S2Bd1 := "Option Pricing Input"."Time to Expiration (T)" * lnValue3S2Bd1;
//                         // lnValue8S2d1 := lnValue4S2d1 / 100;
//                         lnValue5S2Bd1 := math.Log(scenarioPrice6 / "Option Pricing Input"."Strike Rate (X)") + lnValue4S2Bd1;
//                         lnValue6S2Bd1 := "Option Pricing Input"."Volatility (v)" * math.Sqrt("Option Pricing Input"."Time to Expiration (T)");
//                         // if lnValue6 <>
//                         lnValue7S2Bd1 := lnValue5S2Bd1 / lnValue6S2Bd1;
//                         // if lnValue6 <>


//                         ValueD2S2Bd2 := Power("Option Pricing Input"."Time to Expiration (T)", 1 / 2) * "Option Pricing Input"."Volatility (v)";
//                         ValueD21S2Bd2 := Round(lnValue7S2Bd1 - ValueD2S2Bd2);



//                         //Clear(SC1APUTPrice3);

//                         SC1ACallPrice1 := scenarioPrice1 * NORMSDIST(lnValue7);
//                         SC1ACallPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC1ACallPrice2 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC1ACallPrice11) * NORMSDIST(ValueD21);
//                         SC1ACallPrice3 := Round(SC1ACallPrice1 - SC1ACallPrice2, 0.05);
//                         SC1ACallPrice4 := MaxValue(SC1ACallPrice3, 0.05);
//                         SC1ACallPrice4 := CalculateCustomValue(scenarioPrice1, "Option Pricing Input"."Strike Rate (X)", "Option Pricing Input"."Time to Expiration (T)", 7 / 100, lnValue7, ValueD21);

//                         SC1APUTPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC1APUTPrice1 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC1APUTPrice11);
//                         SC1APUTPrice2 := SC1APUTPrice1 * NORMSDIST(-ValueD21);
//                         SC1APUTPrice3 := Round(SC1APUTPrice2 - scenarioPrice1 * NORMSDIST(-lnValue7), 0.05);
//                         SC1APUTPrice4 := MaxValue(SC1APUTPrice3, 0.05);




//                         SC2ACallPrice1 := scenarioPrice2 * NORMSDIST(lnValue7S2d1);
//                         SC2ACallPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC2ACallPrice2 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC2ACallPrice11) * NORMSDIST(ValueD21S2d2);
//                         SC2ACallPrice3 := Round(SC2ACallPrice1 - SC2ACallPrice2, 0.05);
//                         SC2ACallPrice4 := MaxValue(SC2ACallPrice3, 0.05);


//                         SC2APUTPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC2APUTPrice1 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC2APUTPrice11);
//                         SC2APUTPrice2 := SC2APUTPrice1 * NORMSDIST(-ValueD21S2d2);
//                         SC2APUTPrice3 := Round(SC2APUTPrice2 - scenarioPrice2 * NORMSDIST(-lnValue7S2d1), 0.05);
//                         SC2APUTPrice4 := MaxValue(SC2APUTPrice3, 0.05);



//                         SC2A1CallPrice1 := scenarioPrice5 * NORMSDIST(lnValue7S2Ad1);
//                         SC2A1CallPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC2A1CallPrice2 := "Option Pricing Input"."Strike Rate (X)" * Exp(-SC2A1CallPrice11) * NORMSDIST(ValueD21S2Ad2);
//                         SC2A1CallPrice3 := Round(SC2A1CallPrice1 - SC2A1CallPrice2, 0.05);
//                         SC2A1CallPrice4 := MaxValue(SC2A1CallPrice3, 0.05);
//                         //SC2A1CallPrice4 := CalculateOptionValue(scenarioPrice5, lnValue7S2Ad1, "Option Pricing Input"."Strike Rate (X)", 7 / 100, "Option Pricing Input"."Time to Expiration (T)", ValueD21S2Ad2);

//                         SC2A1PUTPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC2A1PUTPrice1 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC2A1PUTPrice11);
//                         SC2A1PUTPrice2 := SC2A1PUTPrice1 * NORMSDIST(-ValueD21S2Ad2);
//                         SC2A1PUTPrice3 := Round(SC2A1PUTPrice2 - scenarioPrice5 * NORMSDIST(-lnValue7S2Ad1), 0.05);
//                         SC2A1PUTPrice4 := MaxValue(SC2A1PUTPrice3, 0.05);


//                         SC2BCallPrice1 := scenarioPrice6 * NORMSDIST(lnValue7S2Bd1);
//                         SC2BCallPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC2BCallPrice2 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC2BCallPrice11) * NORMSDIST(ValueD21S2Bd2);
//                         SC2BCallPrice3 := Round(SC2BCallPrice1 - SC2BCallPrice2, 0.05);
//                         SC2BCallPrice4 := MaxValue(SC2BCallPrice3, 0.05);


//                         SC2BPUTPrice11 := -7 / 100 * "Option Pricing Input"."Time to Expiration (T)";
//                         SC2BPUTPrice1 := "Option Pricing Input"."Strike Rate (X)" * Exp(SC2BPUTPrice11);
//                         SC2BPUTPrice2 := SC2BPUTPrice1 * NORMSDIST(-ValueD21S2Bd2);
//                         SC2BPUTPrice3 := Round(SC2BPUTPrice2 - scenarioPrice6 * NORMSDIST(-lnValue7S2Bd1), 0.05);
//                         SC2BPUTPrice4 := MaxValue(SC2BPUTPrice3, 0.05);

//                     end else begin


//                         FPSC1A := scenarioPrice1 * Exp(7 / 100 * "Option Pricing Input"."Time to Expiration (T)");
//                         FPSC1B := scenarioPrice2 * Exp(7 / 100 * "Option Pricing Input"."Time to Expiration (T)");
//                         FPSC2A := scenarioPrice5 * Exp(7 / 100 * "Option Pricing Input"."Time to Expiration (T)");
//                         FPSC2B := scenarioPrice6 * Exp(7 / 100 * "Option Pricing Input"."Time to Expiration (T)");
//                     end;
//                 end;
//                 ExcelBuffer.NewRow;
//                 ExcelBuffer.AddColumn(sr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn("Report Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn("Expiry Date", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn("Series ID", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 //  ExcelBuffer.AddColumn("EDX_BC."Call Put"", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn("Option Type", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn("Asset Code", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn("Actual Spot Rate", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 ExcelBuffer.AddColumn(scenarioPrice1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice5, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(scenarioPrice6, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn("Option Pricing Input"."Strike Rate (X)", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn("Option Pricing Input"."Time to Expiration (T)", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn('7.00', FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn("Option Pricing Input"."Volatility (v)", FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(lnValue7, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(ValueD21, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000', ExcelBuffer."Cell Type"::Number);

//                 ExcelBuffer.AddColumn(SC1ACallPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(SC1APUTPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(lnValue7S2d1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(ValueD21S2d2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00000', ExcelBuffer."Cell Type"::Number);

//                 ExcelBuffer.AddColumn(SC2ACallPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(SC2APUTPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(lnValue7S2Ad1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(ValueD21S2Ad2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(SC2A1CallPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(SC2A1PUTPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(lnValue7S2Bd1, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(ValueD21S2Bd2, FALSE, '', FALSE, FALSE, FALSE, '#,0.00', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(SC2BCallPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(SC2BPUTPrice4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(FPSC1A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(FPSC1B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(FPSC2A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//                 ExcelBuffer.AddColumn(FPSC2B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);

//                 //ExcelBuffer.AddColumn(ItemTenantMedia.Content, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//                 //  ExcelBuffer.AddPicture(1, 2, PictureStream, 'Item Picture', 2, 2);  // Width: 150, Height: 150
//                 // CreateTestEntry("Option Pricing Input", FPSC1A, FPSC1B, FPSC2A, FPSC2B)
//             end;
//         }
//     }



//     requestpage
//     {
//         AboutTitle = 'Teaching tip title';
//         AboutText = 'Teaching tip content';
//         layout
//         {
//             area(Content)
//             {
//                 group(GroupName)
//                 {
//                     // group("Date Filters")
//                     // {
//                     //     field(FromDate; FromDate)
//                     //     {
//                     //         ApplicationArea = All;
//                     //         Caption = 'From Date';
//                     //     }
//                     //     field(ToDate; ToDate)
//                     //     {
//                     //         ApplicationArea = All;
//                     //         Caption = 'To Date';
//                     //     }
//                     // }
//                 }
//             }
//         }


//         actions
//         {
//             area(processing)
//             {
//                 action(LayoutName)
//                 {

//                 }
//             }
//         }
//     }





//     var
//         // myInt: Integer;
//         ExcelBuffer: Record "Excel Buffer" temporary;
//         FromDate: Date;
//         Sr: Integer;
//         ToDate: Date;
//         math: Codeunit "Math";
//         PeriodText1: Text[30];
//         PeriodText: Text[30];
//         scenario1: Decimal;
//         scenario2: Decimal;
//         scenario5: Decimal;
//         scenario6: Decimal;
//         EQDFullSp: Record EQD_FullSp;
//         ContractUnderlinePrice: Decimal;
//         scenarioPrice1: Decimal;
//         scenarioPrice2: Decimal;
//         scenarioPrice5: Decimal;
//         scenarioPrice6: Decimal;
//         Item: Record Item;
//         lnValue7S2Ad1Test: Decimal;
//         lnValue7S2Ad1Test1: Decimal;

//         TempBlob: Codeunit "Temp Blob";
//         Instr: InStream;
//         OutStr: OutStream;
//         Picture: Guid;
//         ItemPicture: Page "Item Picture";
//         ItemTenantMedia: Record "Tenant Media";
//         SC1ACallPrice: Decimal;
//         SC1APutPrice: Decimal;
//         SC1ACallPrice1: Decimal;
//         SC1APutPrice1: Decimal;
//         SC1APutPrice11: Decimal;

//         SC1ACallPrice2: Decimal;
//         SC1ACallPrice11: Decimal;

//         SC1APutPrice2: Decimal;
//         SC1ACallPrice3: Decimal;
//         SC1APutPrice3: Decimal;
//         SC1ACallPrice4: Decimal;
//         SC1APutPrice4: Decimal;
//         SC1ACallPrice5: Decimal;
//         SC1APutPrice5: Decimal;

//         SC2ACallPrice: Decimal;
//         SC2APutPrice: Decimal;
//         SC2ACallPrice1: Decimal;
//         SC2APutPrice1: Decimal;
//         SC2APutPrice11: Decimal;

//         SC2ACallPrice2: Decimal;
//         SC2ACallPrice11: Decimal;

//         SC2APutPrice2: Decimal;
//         SC2ACallPrice3: Decimal;
//         SC2APutPrice3: Decimal;
//         SC2ACallPrice4: Decimal;
//         SC2APutPrice4: Decimal;
//         SC2ACallPrice5: Decimal;
//         SC2APutPrice5: Decimal;


//         SC2A1CallPrice: Decimal;
//         SC2A1PutPrice: Decimal;
//         SC2A1CallPrice1: Decimal;
//         SC2A1PutPrice1: Decimal;
//         SC2A1PutPrice11: Decimal;

//         SC2A1CallPrice2: Decimal;
//         SC2A1CallPrice11: Decimal;

//         SC2A1PutPrice2: Decimal;
//         SC2A1CallPrice3: Decimal;
//         SC2A1PutPrice3: Decimal;
//         SC2A1CallPrice4: Decimal;
//         SC2A1PutPrice4: Decimal;
//         SC2A1CallPrice5: Decimal;
//         SC2A1PutPrice5: Decimal;


//         SC2BCallPrice: Decimal;
//         SC2BPutPrice: Decimal;
//         SC2BCallPrice1: Decimal;
//         SC2BPutPrice1: Decimal;
//         SC2BPutPrice11: Decimal;

//         SC2BCallPrice2: Decimal;
//         SC2BCallPrice11: Decimal;

//         SC2BPutPrice2: Decimal;
//         SC2BCallPrice3: Decimal;
//         SC2BPutPrice3: Decimal;
//         SC2BCallPrice4: Decimal;
//         SC2BPutPrice4: Decimal;
//         SC2BCallPrice5: Decimal;
//         SC2BPutPrice5: Decimal;
//         lnValueS2d1: Decimal;
//         lnValue1S2d1: Decimal;
//         lnValue2S2d1: Decimal;
//         lnValue3S2d1: Decimal;
//         lnValue4S2d1: Decimal;
//         lnValue5S2d1: Decimal;
//         lnValue6S2d1: Decimal;
//         lnValue7S2d1: Decimal;
//         lnValue8S2d1: Decimal;
//         ValueD2S2d2: Decimal;
//         ValueD21S2d2: Decimal;
//         ValueD22S2d2: Decimal;
//         lnValueS2Ad1: Decimal;
//         lnValue1S2Ad1: Decimal;
//         lnValue2S2Ad1: Decimal;
//         lnValue3S2Ad1: Decimal;
//         lnValue4S2Ad1: Decimal;
//         lnValue5S2Ad1: Decimal;
//         lnValue6S2Ad1: Decimal;
//         lnValue7S2Ad1: Decimal;
//         lnValue8S2Ad1: Decimal;
//         ValueD2S2Ad2: Decimal;
//         ValueD21S2Ad2: Decimal;
//         ValueD22S2Ad2: Decimal;
//         lnValueS2Bd1: Decimal;
//         lnValue1S2Bd1: Decimal;
//         lnValue2S2Bd1: Decimal;
//         lnValue3S2Bd1: Decimal;
//         lnValue4S2Bd1: Decimal;
//         lnValue5S2Bd1: Decimal;
//         lnValue6S2Bd1: Decimal;
//         lnValue7S2Bd1: Decimal;
//         lnValue8S2Bd1: Decimal;
//         ValueD2S2Bd2: Decimal;
//         ValueD21S2Bd2: Decimal;
//         ValueD22S2Bd2: Decimal;

//         FPSC1A: Decimal;
//         FPSC1B: Decimal;
//         FPSC2A: Decimal;
//         FPSC2B: Decimal;
//         FPSC1A1: Decimal;
//         FPSC1B1: Decimal;
//         FPSC2A1: Decimal;
//         FPSC2B1: Decimal;
//         myInt: Integer;
//         Sen: Decimal;
//         Sen1: Decimal;
//         Sen2: Decimal;
//         Sen3: Decimal;
//         Sen4: Decimal;
//         Sen5: Decimal;
//         Sen6: Decimal;
//         Sen7: Decimal;
//         scenario12: Decimal;
//         SenPrice1: Decimal;
//         SenPrice2: Decimal;
//         SenPrice3: Decimal;
//         SenPrice4: Decimal;
//         DayDifference: Integer;
//         timetoExpiration: Decimal;
//         lnValue: Decimal;
//         lnValue1: Decimal;
//         lnValue2: Decimal;
//         lnValue3: Decimal;
//         lnValue4: Decimal;
//         lnValue5: Decimal;
//         lnValue6: Decimal;
//         lnValue7: Decimal;
//         lnValue8: Decimal;
//         ValueD2: Decimal;
//         ValueD21: Decimal;
//         ValueD22: Decimal;
//         SC1ACellPrice: Decimal;
//         SC1ACellPrice1: Decimal;
//         SC1ACellPrice2: Decimal;
//         SC1ACellPrice3: Decimal;
//         EDX_BC: Record "Senario Price Input";

//     trigger OnPreReport()
//     var
//         myInt: Integer;

//     begin
//         ExcelBuffer.DELETEALL;
//         Clear(PeriodText);
//         Clear(PeriodText1);
//         PeriodText := Format(FromDate);
//         PeriodText1 := Format(ToDate);

//         // companyinf.Reset();
//         // if companyinf.FindFirst() then
//         //     CompName := companyinf.Name;

//         MakeExcelInfo();
//         MakeExcelHeader();




//     end;

//     trigger OnPostReport()
//     var
//         myInt: Integer;
//     begin
//         CreateExcel();
//     end;

//     procedure MakeexcelInfo()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.SetUseInfoSheet;
//         ExcelBuffer.AddInfoColumn(COMPANYNAME, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddInfoColumn(USERID, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddInfoColumn(Today, false, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.ClearNewRow;
//     end;

//     procedure MakeExcelHeader()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn('BSM Model_OptionPricing', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//         // ExcelBuffer.NewRow();
//         // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//         // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
//         ExcelBuffer.NewRow();
//         ExcelBuffer.AddColumn('Details BSM Model_OptionPricing', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
//     end;



//     procedure CreateExcel()
//     var
//         myInt: Integer;
//     begin
//         ExcelBuffer.CreateNewExcelBookY('', 'BSM Model_OptionPricing', 'BSM Model_OptionPricing', CompanyName, UserId);
//     end;


//     procedure Logarithm(Number: Decimal; Base: Decimal): Decimal;
//     var
//         NaturalLogNumber: Decimal;
//         NaturalLogBase: Decimal;
//     begin
//         if Number <= 0 then
//             Error('The number must be greater than 0.');

//         if Base <= 0 then
//             Error('The base must be greater than 0.');

//         // Calculate natural logarithms using an approximation method
//         NaturalLogNumber := CalculateNaturalLog(Number);
//         NaturalLogBase := CalculateNaturalLog(Base);

//         // Logarithm of Number with the specified base
//         exit(NaturalLogNumber / NaturalLogBase);
//     end;

//     procedure CalculateNaturalLog(X: Decimal): Decimal;
//     var
//         PreviousValue: Decimal;
//         CurrentValue: Decimal;
//         Difference: Decimal;
//         Iterations: Integer;
//         MaxIterations: Integer;
//     begin
//         // Newton's method for approximating natural log
//         PreviousValue := 0;
//         CurrentValue := X - 1; // Start approximation from (X - 1)
//         Difference := CurrentValue - PreviousValue;
//         Iterations := 0;
//         MaxIterations := 1000; // Set a maximum number of iterations

//         while (ABS(Difference) > 0.000001) and (Iterations < MaxIterations) do begin
//             PreviousValue := CurrentValue;
//             CurrentValue := PreviousValue - ((Exp(PreviousValue) - X) / Exp(PreviousValue)); // Newton's method step
//             Difference := CurrentValue - PreviousValue;
//             Iterations += 1;
//         end;

//         exit(CurrentValue);
//     end;



//     procedure CalculateLnOfTwo(): Decimal
//     var
//         ln2Approximation: Decimal;
//         n: Integer;
//         term, x : Decimal;
//     begin
//         ln2Approximation := 0;
//         x := (2 - 1); // for ln(2), x = 1 (because ln(1+x) = ln(2) when x = 1)

//         // Calculate using a simple Taylor series expansion for ln(1+x)
//         for n := 1 to 100 do begin
//             term := Power(x, n) / n; // Calculate each term of the series
//             if n mod 2 = 0 then
//                 ln2Approximation -= term // Subtract even terms
//             else
//                 ln2Approximation += term; // Add odd terms
//         end;

//         // Message('Approximated natural logarithm of 2: %1', ln2Approximation);
//         exit(ln2Approximation);
//     end;


//     procedure InsertImageInExcel()
//     var
//         ImageStream: InStream;
//         FilePath: Text;
//         FileManagement: Codeunit "File Management";


//     begin
//         // Load your image from a file or Blob into a stream
//         // FilePath := 'C:\Images\Logo.png';
//         // if FileManagement.BLOBImportWithFilter(FilePath, ImageStream) then begin
//         // Handle stream to load into Excel using external library or extension
//         // Use EPPlus or OpenXML library to work with Excel files directly.
//         // end;
//     end;

//     procedure NORMSDIST(x: Decimal): Decimal;
//     var
//         pi: Decimal;
//         erfResult: Decimal;
//     begin
//         // Constant values
//         pi := 3.14159265359;

//         // Approximation of the cumulative normal distribution using the error function (erf)
//         erfResult := ERF(x / Power(2, 1 / 2));
//         //Power(2, 1 / 2)

//         // Calculate the NORMSDIST result
//         exit(0.5 * (1 + erfResult));
//     end;

//     procedure ERF(x: Decimal): Decimal;
//     var
//         t: Decimal;
//         z: Decimal;
//         tau: Decimal;
//     begin
//         // Using an approximation formula for the error function (erf)
//         t := 1 / (1 + 0.3275911 * ABS(x));
//         z := t * (0.254829592 - t * (0.284496736 - t * (1.421413741 - t * (1.453152027 - t * 1.061405429))));

//         tau := 1 - z * EXP(-x * x);
//         if x >= 0 then
//             exit(tau)
//         else
//             exit(-tau);
//     end;

//     procedure Exp(X: Decimal): Decimal;
//     var
//         Result: Decimal;
//         Term: Decimal;
//         i: Integer;
//     begin
//         // Exponential series approximation: e^x = 1 + x + x^2/2! + x^3/3! + ...
//         Result := 1;
//         Term := 1;
//         // for i := 1 to 100 do begin
//         //     Term := (Term * X) / i;
//         //     Result := Result + Term;
//         // end;
//         for i := 1 to 100 do begin
//             Term := (Term * X) / i;
//             if ABS(Term) < 0.000000000001 then // 10^-10 or your precision threshold
//                 break;
//             Result := Result + Term;
//         end;

//         exit(Result);
//     end;

//     procedure MaxValue(a: Decimal; b: Decimal): Decimal;
//     begin
//         if a > b then
//             exit(a)
//         else
//             exit(b);
//     end;

//     procedure CalculateCustomFormula(H6: Decimal; L6: Decimal; N6: Decimal; O6: Decimal; M6: Decimal): Decimal
//     var
//         lnPart: Decimal;
//         numerator: Decimal;
//         denominator: Decimal;
//     begin
//         if (L6 <> 0) or (O6 <> 0) or (M6 <> 0) then
//             lnPart := CalculateLn(H6 / L6);

//         numerator := (N6 + ((O6 * O6) / 2)) * M6;
//         denominator := O6 * SqrtDecimal(M6);

//         exit((lnPart + numerator) / denominator);
//     end;

//     // procedure CalculateLn(x: Decimal): Decimal
//     // var
//     //     lnApprox: Decimal;
//     //     y, term : Decimal;
//     //     i: Integer;
//     //     x1: Decimal;

//     // begin
//     //     x1 := x;
//     //     lnApprox := 0;
//     //     if x <= 0 then
//     //         //    Error('Natural logarithm is undefined for non-positive numbers.');

//     //         while x > 1.5 do begin
//     //             lnApprox += 0.69314718; // ln(2)
//     //             x := x / 2;
//     //         end;
//     //     while x < 0.5 do begin
//     //         lnApprox -= 0.69314718;
//     //         x := x * 2;
//     //     end;

//     //     y := (x - 1) / (x + 1);
//     //     term := y;
//     //     i := 1;
//     //     lnApprox += 2 * term;

//     //     repeat
//     //         i += 2;
//     //         term := term * y * y;
//     //         lnApprox += 2 * term / i;
//     //     until (Abs(term) < 0.0000000001) or (i > 99);

//     //     exit(lnApprox);
//     // end;
//     procedure CalculateLn(x: Decimal): Decimal
//     var
//         lnApprox, y, term : Decimal;
//         i: Integer;
//     begin
//         if x <= 0 then
//             //    Error('Natural logarithm is undefined for non-positive numbers.');

//             // Input scaling for better convergence
//             lnApprox := 0;
//         while x > 1.5 do begin
//             x := x / 2;
//             lnApprox += 0.69314718; // ln(2)
//         end;

//         while x < 0.5 do begin
//             x := x * 2;
//             lnApprox -= 0.69314718; // ln(2)
//         end;

//         // Use Mercator series with incremental multiplication to avoid Power()
//         y := (x - 1) / (x + 1);
//         term := y;
//         i := 1;
//         lnApprox += 2 * term;

//         repeat
//             i += 2;
//             term := term * y * y;
//             if Abs(term / i) < 0.0000000001 then
//                 break;
//             lnApprox += 2 * term / i;
//         until i > 99;

//         exit(lnApprox);
//     end;

//     procedure SqrtDecimal(x: Decimal): Decimal
//     var
//         guess, prevGuess : Decimal;
//     begin
//         if x < 0 then
//             Error('Square root of negative number.');

//         if x = 0 then
//             exit(0);

//         guess := x / 2;
//         repeat
//             prevGuess := guess;
//             guess := (guess + (x / guess)) / 2;
//         until Abs(guess - prevGuess) < 0.0000000001;

//         exit(guess);
//     end;

//     procedure CalculateCustomValue(H: Decimal; L: Decimal; M: Decimal; N: Decimal; P: Decimal; Q: Decimal): Decimal
//     var
//         Result: Decimal;
//         Term1: Decimal;
//         Term2: Decimal;
//     begin
//         Term1 := H * NormSDist1(P);
//         Term2 := L * Exp(-N * M) * NormSDist1(Q);
//         Result := Term1 - Term2;

//         Result := RoundToNearest(Result, 0.05);
//         if Result < 0.05 then
//             exit(0.05);
//         exit(Result);
//     end;

//     procedure NormSDist1(x: Decimal): Decimal
//     var
//         t: Decimal;
//         d: Decimal;
//     begin
//         // Approximation of NORMSDIST using Abramowitz & Stegun formula
//         t := 1 / (1 + 0.2316419 * Abs(x));
//         d := 0.3989423 * Exp(-x * x / 2);

//         exit(1 - d * (0.3193815 * t - 0.3565638 * Power(t, 2) + 1.781478 * Power(t, 3)
//                      - 1.821256 * Power(t, 4) + 1.330274 * Power(t, 5)));
//     end;

//     procedure RoundToNearest(Value: Decimal; Multiple: Decimal): Decimal
//     begin
//         exit(Round(Value / Multiple, 1) * Multiple);
//     end;

//     procedure CalculateOptionValue(J: Decimal; X: Decimal; L: Decimal; N: Decimal; M: Decimal; Y: Decimal): Decimal
//     var
//         Result: Decimal;
//         Term1: Decimal;
//         Term2: Decimal;
//     begin
//         Term1 := J * NormSDist(X);
//         Term2 := L * Exp(-N * M) * NormSDist(Y);

//         Result := Term1 - Term2;

//         // Round to nearest 0.05
//         Result := RoundToNearest(Result, 0.05);

//         // Enforce minimum of 0.05
//         if Result < 0.05 then
//             exit(0.05);
//         exit(Result);
//     end;

//     procedure NormSDist2(x: Decimal): Decimal
//     var
//         t: Decimal;
//         d: Decimal;
//     begin
//         t := 1 / (1 + 0.2316419 * Abs(x));
//         d := 0.3989423 * Exp(-x * x / 2);

//         if x >= 0 then
//             exit(1 - d * (0.3193815 * t - 0.3565638 * Power(t, 2) + 1.781478 * Power(t, 3)
//                          - 1.821256 * Power(t, 4) + 1.330274 * Power(t, 5)))
//         else
//             exit(1 - NormSDist1(-x)); // symmetry
//     end;

//     procedure RoundToNearest1(Value: Decimal; Step: Decimal): Decimal
//     begin
//         exit(Round(Value / Step, 1) * Step);
//     end;

//     procedure CalculateD1(J6: Decimal; L6: Decimal; N6: Decimal; O6: Decimal; M6: Decimal): Decimal
//     var
//         Result: Decimal;
//     begin
//         if (L6 = 0) or (O6 = 0) or (M6 = 0) then
//             Error('Invalid input: Division by zero');

//         Result :=
//             (CalculateLn(J6 / L6) + ((N6 + (Power(O6, 2) / 2)) * M6)) /
//             (O6 * Sqrt(M6));

//         exit(Result);
//     end;

//     procedure Sqrt(Value: Decimal): Decimal
//     var
//         Guess: Decimal;
//         Tolerance: Decimal;
//         Difference: Decimal;
//     begin
//         if Value < 0 then
//             Error('Cannot compute square root of a negative number.');

//         if Value = 0 then
//             exit(0);

//         Guess := Value / 2;
//         Tolerance := 0.00000001;

//         repeat
//             Difference := (Guess * Guess - Value) / (2 * Guess);
//             Guess := Guess - Difference;
//         until Abs(Difference) < Tolerance;

//         exit(Guess);
//     end;

//     procedure CreateTestEntry(InputEntry: Record "Option Pricing Input"; FPSC1A1: Decimal;
//         FPSC1B1: Decimal;
//         FPSC2A1: Decimal;
//         FPSC2B1: Decimal)
//     var
//         Entry: Record "BSM Model Pricing Uotput";
//         SrNo: Integer;
//         LastSrNo: Integer;
//     begin
//         //Entry.DeleteAll();
//         //Entry.Delete();
//         Entry.Init();

//         if Entry.FindLast() then
//             LastSrNo := Entry."Sr. No." + 1
//         else
//             LastSrNo := 1;

//         Entry."Sr. No." := LastSrNo;
//         // Populate test entry
//         Entry.Init();
//         // Entry."Sr. No." := SrNo;
//         Entry."Sr. No." := LastSrNo;
//         Entry."Report Date" := InputEntry."Report Date";
//         Entry."Expiry Date" := InputEntry."Expiry Date";
//         Entry."Series ID" := InputEntry."Series ID";
//         Entry."Call Put" := InputEntry."Option Type";
//         Entry."Asset Code" := InputEntry."Asset Code";
//         Entry."Actual Spot Rate" := InputEntry."Actual Spot Rate";
//         Entry."Revised Spot Rate S1" := scenarioPrice1;
//         Entry."Revised Spot Rate S2" := scenarioPrice2;
//         Entry."Revised Spot Rate S3" := scenarioPrice5;
//         Entry."Revised Spot Rate S4" := scenarioPrice6;
//         Entry."Strike Rate" := InputEntry."Strike Rate (X)";
//         Entry."Time to Expiration" := "Option Pricing Input"."Time to Expiration (T)";
//         Entry."Rate" := 7.00;
//         Entry."Volatility (v)" := InputEntry."Volatility (v)";

//         Entry."d1 SC1A" := lnValue7;
//         Entry."d2 SC1A" := ValueD21;
//         Entry."Call Price SC1A" := SC1ACallPrice4;
//         Entry."Put Price SC1A" := SC1APUTPrice4;

//         Entry."d1 SC1B" := lnValue7S2d1;
//         Entry."d2 SC1B" := ValueD21S2d2;
//         Entry."Call Price SC1B" := SC2ACallPrice4;
//         Entry."Put Price SC1B" := SC2APUTPrice4;

//         Entry."d1 SC2A" := lnValue7S2Ad1;
//         Entry."d2 SC2A" := ValueD21S2Ad2;
//         Entry."Call Price SC2A" := SC2A1CallPrice4;
//         Entry."Put Price SC2A" := SC2A1PUTPrice4;

//         Entry."d1 SC2B" := lnValue7S2Bd1;
//         Entry."d2 SC2B" := ValueD21S2Bd2;
//         Entry."Call Price SC2B" := SC2BCallPrice4;
//         Entry."Put Price SC2B" := SC2BPUTPrice4;

//         Entry."Future Price SC1A" := FPSC1A1;
//         Entry."Future Price SC1B" := FPSC1B1;
//         Entry."Future Price SC1A" := FPSC2A1;
//         Entry."Future Price SC1A" := FPSC2B1;
//         Entry.Insert();
//     end;

// }