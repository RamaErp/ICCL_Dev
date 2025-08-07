report 70156 "CM Final Loss On Scenario"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem(CMFinalLossOnScenario_New; CMFinalLossOnScenario_New)
        {
            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                LargeValue := 0;
                LargeValue1 := 0;
                LargeValue2 := 0;
                LargeValue3 := 0;
                LargeValue4 := 0;
                LargeValue5 := 0;
                LargeValue6 := 0;
                LargeValue7 := 0;
                LargeValue8 := 0;

                Sr := 0;
                ExcelBuffer.NewRow();
                ExcelBuffer.AddColumn('Sr.No', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('CmCode', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FundsPayInPreDay', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //  ExcelBuffer.AddColumn('Client Code', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FundsPayOutPreDay', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FundsPayInAtEODPrice', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FundsPayOutAtEODPrice', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Loss (+) OnScenario1A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Loss (+) OnScenario1B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Loss (+) OnScenario2A', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('Loss (+) OnScenario2B', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('LossOnScenario3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('LossOnScenario4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('ProprietaryMarginRTRMS', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FinalLoss (+) OnScenario1', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FinalLoss (+) OnScenario2', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FinalLoss (+) OnScenario3', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                ExcelBuffer.AddColumn('FinalLoss (+) OnScenario4', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);

            end;

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                Clear(SenPrice1A);
                Clear(SenPrice1B);
                Clear(SenPrice2A);
                Clear(SenPrice2B);
                Clear(scenario3);
                Clear(scenario4);
                ScenarioAnalysis.Reset();
                ScenarioAnalysis.SetRange("CmCode", CMFinalLossOnScenario_New.CmCode);
                //ScenarioAnalysis.SetRange("TmCode", CMTmLevelLoss.TmCode);
                //ScenarioAnalysis.SetRange("ClientCode", "Client Level Profit Loss".ClientCode);
                if ScenarioAnalysis.FindSet() then begin
                    repeat
                        SenPrice1A += ScenarioAnalysis."NetLoss (-) OnScenario1A";
                        SenPrice1B += -ScenarioAnalysis."NetLoss (-) OnScenario1B";
                        SenPrice2A += -ScenarioAnalysis."NetLoss (-) OnScenario2A";
                        SenPrice2B += -ScenarioAnalysis."NetLoss (-) OnScenario2b";
                        scenario3 += -ScenarioAnalysis."NetLoss (-) OnScenario3";
                        scenario4 += -ScenarioAnalysis."NetLoss (-) OnScenario4";
                    until ScenarioAnalysis.Next() = 0
                end;
                //  if CMFinalLossOnScenario_New."Client Code" = 'OWN' then
                //      NetPLSenPrice1A := SenPrice1A
                //  else
                //      NetPLSenPrice1A := CMFinalLossOnScenario_New.Margin + SenPrice1A;


                //  if CMFinalLossOnScenario_New.ClientCode = 'OWN' then
                //      NetPLSenPrice1B := SenPrice1B
                //  else
                //      NetPLSenPrice1B := CMFinalLossOnScenario_New.Margin + SenPrice1B;

                //  if CMFinalLossOnScenario_New.ClientCode = 'OWN' then
                //      NetPLSenPrice2A := SenPrice2A
                //  else
                //      NetPLSenPrice2A := CMFinalLossOnScenario_New.Margin + SenPrice2A;

                //  if CMFinalLossOnScenario_New.ClientCode = 'OWN' then
                //      NetPLSenPrice2B := SenPrice2B
                //  else
                //      NetPLSenPrice2B := CMFinalLossOnScenario_New.Margin + SenPrice2B;

                //  if CMFinalLossOnScenario_New.ClientCode = 'OWN' then
                //      NetPLscenario3 := scenario3
                //  else
                //      NetPLscenario3 := CMFinalLossOnScenario_New.Margin + scenario3;

                //  if CMFinalLossOnScenario_New.ClientCode = 'OWN' then
                //      NetPLscenario4 := scenario4
                //  else
                //      NetPLscenario4 := CMFinalLossOnScenario_New.Margin + scenario4;



                Clear(NetLLossenPrice1A);
                NetLLossenPrice1A := GetAdjustedProfitLoss(SenPrice1A);
                Clear(NetLLossSenPrice1B);
                NetLLossSenPrice1B := GetAdjustedProfitLoss(SenPrice1B);
                Clear(NetLLossSenPrice2A);
                NetLLossSenPrice2A := GetAdjustedProfitLoss(SenPrice2A);
                Clear(NetLLossSenPrice2B);
                NetLLossSenPrice2B := GetAdjustedProfitLoss(SenPrice2B);
                Clear(NetLLossscenario3);
                NetLLossscenario3 := GetAdjustedProfitLoss(scenario3);
                Clear(NetLLossscenario4);
                NetLLossscenario4 := GetAdjustedProfitLoss(scenario4);



                Clear(finalLossSenario1);
                Clear(finalLossSenario2);
                Clear(finalLossSenario3);
                Clear(finalLossSenario4);


                Clear(NetPLSenPrice1A);
                Clear(NetPLSenPrice1B);
                NetPLSenPrice1A := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + SenPrice1A - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                NetPLSenPrice1B := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + SenPrice1B - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                finalLossSenario1 := MaxValue(NetPLSenPrice1A, NetPLSenPrice1B);


                Clear(NetPLSenPrice2A);
                Clear(NetPLSenPrice2B);
                NetPLSenPrice2A := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + SenPrice2A - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                NetPLSenPrice2B := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + SenPrice2B - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                finalLossSenario2 := MaxValue(NetPLSenPrice2A, NetPLSenPrice2B);





                finalLossSenario3 := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + scenario3 - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;


                finalLossSenario4 := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + scenario4 - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;


                //  Clear(NetPLSenPrice1A);
                //  Clear(NetPLSenPrice1B);
                //  NetPLSenPrice1A := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + NetLLossenPrice1A - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                //  NetPLSenPrice1B := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + NetLLossSenPrice1B - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                //  finalLossSenario1 := MaxValue(NetPLSenPrice1A, NetPLSenPrice1B);


                //  Clear(NetPLSenPrice2A);
                //  Clear(NetPLSenPrice2B);
                //  NetPLSenPrice2A := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + NetLLossSenPrice2A - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                //  NetPLSenPrice2B := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + NetLLossSenPrice2B - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                //  finalLossSenario2 := MaxValue(NetPLSenPrice2A, NetPLSenPrice2B);



                //  finalLossSenario3 := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + NetLLossscenario3 - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                //  finalLossSenario4 := CMFinalLossOnScenario_New.FundsPayInPreDay - CMFinalLossOnScenario_New.FundsPayOutPreDay + CMFinalLossOnScenario_New.FundsPayInAtEODPrice - CMFinalLossOnScenario_New.FundsPayOutAtEODPrice + NetLLossscenario4 - CMFinalLossOnScenario_New.ProprietaryMarginRTRMS;
                //  TotalNetLLossenPrice1A += NetLLossenPrice1A;
                //  TotalNetLLossSenPrice1B += NetLLossSenPrice1B;
                //  TotalNetLLossSenPrice2A += -NetLLossSenPrice2A;
                //  TotalNetLLossSenPrice2B += -NetLLossSenPrice2B;
                //  TotalNetLLossscenario3 += NetLLossscenario3;
                //  TotalNetLLossscenario4 += NetLLossscenario4;



                //  finalLossSenario1 := CalculateMaxValue(CMFinalLossOnScenario_New.FundsPayInPreDay, CMFinalLossOnScenario_New.FundsPayOutPreDay, CMFinalLossOnScenario_New.FundsPayInAtEODPrice, CMFinalLossOnScenario_New.FundsPayOutAtEODPrice, TotalNetLLossenPrice1A, TotalNetLLossSenPrice1B, 0);
                //  finalLossSenario2 := CalculateMaxValue(CMFinalLossOnScenario_New.FundsPayInPreDay, CMFinalLossOnScenario_New.FundsPayOutPreDay, CMFinalLossOnScenario_New.FundsPayInAtEODPrice, CMFinalLossOnScenario_New.FundsPayOutAtEODPrice, TotalNetLLossSenPrice2A, TotalNetLLossSenPrice2B, 0);
                //  finalLossSenario3 := CalculateNetAmount(CMFinalLossOnScenario_New.FundsPayInPreDay, CMFinalLossOnScenario_New.FundsPayOutPreDay, CMFinalLossOnScenario_New.FundsPayInAtEODPrice, CMFinalLossOnScenario_New.FundsPayOutAtEODPrice, TotalNetLLossscenario3, 0);
                //  finalLossSenario4 := CalculateNetAmount(CMFinalLossOnScenario_New.FundsPayInPreDay, CMFinalLossOnScenario_New.FundsPayOutPreDay, CMFinalLossOnScenario_New.FundsPayInAtEODPrice, CMFinalLossOnScenario_New.FundsPayOutAtEODPrice, TotalNetLLossscenario4, 0);


                //if NetLLossSenPrice2A <> 0 then begin

#pragma warning disable AL0166
                //LargeValue := GetRangeMax()(finalLossSenario1);
#pragma warning restore AL0166
                //if JnlLine.FindSet() then begin
                //repeat

                //  exit(TopTwo);
                Values.Add(finalLossSenario1);
                Values1.Add(finalLossSenario2);
                Values2.Add(finalLossSenario3);
                Values3.Add(finalLossSenario4);


                Sr += 1;
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn(sr, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.CmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
                //    ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.TmCode, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.FundsPayInPreDay, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.FundsPayOutPreDay, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.FundsPayInAtEODPrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.FundsPayOutAtEODPrice, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice1A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice1B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice2A, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(SenPrice2B, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(scenario3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(scenario4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(CMFinalLossOnScenario_New.ProprietaryMarginRTRMS, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(finalLossSenario1, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(finalLossSenario2, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(finalLossSenario3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(finalLossSenario4, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(LargeValue, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);

                // end;
            end;

            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin

                //until JnlLine.Next() = 0;
                // end;
                Count1 := Values.Count();
                if Count1 < 2 then
                    Error('Not enough values in data.');

                // Copy to array for sorting
                I := 1;
                foreach Temp in Values do begin
                    DecArray[I] := Temp;
                    I += 1;
                end;

                // Sort descending
                for I := 1 to Count1 - 1 do
                    for J := I + 1 to Count1 do
                        if DecArray[J] > DecArray[I] then begin
                            Temp := DecArray[I];
                            DecArray[I] := DecArray[J];
                            DecArray[J] := Temp;
                        end;

                // Return top 2
                //TopTwo := List of [Decimal]();
                TopTwo.Add(DecArray[1]);
                TopTwo.Add(DecArray[2]);


                ///////

                Count2 := Values1.Count();
                if Count2 < 2 then
                    Error('Not enough values in data.');


                I1 := 1;
                foreach Temp1 in Values1 do begin
                    DecArray1[I1] := Temp1;
                    I1 += 1;
                end;

                // Sort descending
                for I1 := 1 to Count2 - 1 do
                    for J1 := I1 + 1 to Count2 do
                        if DecArray1[J1] > DecArray1[I1] then begin
                            Temp1 := DecArray1[I1];
                            DecArray1[I1] := DecArray1[J1];
                            DecArray1[J1] := Temp1;
                        end;

                // Return top 2
                //TopTwo := List of [Decimal]();
                TopTwo.Add(DecArray1[1]);
                TopTwo.Add(DecArray1[2]);

                //////


                Count3 := Values2.Count();
                if Count3 < 2 then
                    Error('Not enough values in data.');

                // Copy to array for sorting
                I2 := 1;
                foreach Temp2 in Values2 do begin
                    DecArray2[I2] := Temp2;
                    I2 += 1;
                end;

                // Sort descending
                for I2 := 1 to Count3 - 1 do
                    for J2 := I2 + 1 to Count3 do
                        if DecArray2[J2] > DecArray2[I2] then begin
                            Temp2 := DecArray2[I2];
                            DecArray2[I2] := DecArray2[J2];
                            DecArray2[J2] := Temp2;
                        end;

                // Return top 2
                //TopTwo := List of [Decimal]();
                TopTwo.Add(DecArray2[1]);
                TopTwo.Add(DecArray2[2]);
                ///////
                Count4 := Values3.Count();
                if Count4 < 2 then
                    Error('Not enough values in data.');

                I3 := 1;
                foreach Temp3 in Values3 do begin
                    DecArray3[I3] := Temp3;
                    I3 += 1;
                end;

                // Sort descending
                for I3 := 1 to Count4 - 1 do
                    for J3 := I3 + 1 to Count4 do
                        if DecArray3[J3] > DecArray3[I3] then begin
                            Temp3 := DecArray3[I3];
                            DecArray3[I3] := DecArray3[J3];
                            DecArray3[J3] := Temp3;
                        end;

                // Return top 2
                //TopTwo := List of [Decimal]();
                TopTwo.Add(DecArray3[1]);
                TopTwo.Add(DecArray3[2]);
                ///////

                Clear(LargeValue1);
                Clear(LargeValue2);
                Clear(LargeValue3);
                Clear(LargeValue4);
                Clear(MaxVlaue);
                Clear(FinalValue);
                LargeValue := DecArray[1] + DecArray[2];
                LargeValue1 := DecArray1[1] + DecArray1[2];
                LargeValue2 := DecArray2[1] + DecArray2[2];
                LargeValue3 := DecArray3[1] + DecArray3[2];

                MaxVlaue := GetMaxOfFour(LargeValue, LargeValue1, LargeValue2, LargeValue3);
                FinalValue := MaxVlaue / POWER(10, 7);
                // LargeValue := CMFinalLossOnScenario_New.GetRangeMax(finalLossSenario1)
                ExcelBuffer.NewRow;
                //ExcelBuffer.new;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray1[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray2[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray3[1], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray1[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray2[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(DecArray3[2], FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(LargeValue, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(LargeValue1, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(LargeValue2, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(LargeValue3, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.NewRow;
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn('', FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(MaxVlaue, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
                ExcelBuffer.AddColumn(FinalValue, FALSE, '', FALSE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);


            end;
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }


    }



    var
        myInt: Integer;
        ExcelBuffer: Record "Excel Buffer" temporary;
        Sr: Integer;
        ScenarioAnalysis: Record "Client Level P&L OutPut";

        SenPrice1A: Decimal;
        SenPrice1B: Decimal;
        SenPrice2A: Decimal;
        SenPrice2B: Decimal;
        scenario3: Decimal;
        scenario4: Decimal;
        JnlLine: Record "Gen. Journal Line";
        Values: List of [Decimal];
        TopTwo1: List of [Decimal];
        DecArray: array[1000] of Decimal;
        I, J, Count1 : Integer;
        Values1: List of [Decimal];
        TopTwo: List of [Decimal];
        DecArray1: array[1000] of Decimal;
        I1, J1, Count2 : Integer;
        Values2: List of [Decimal];
        TopTwo2: List of [Decimal];
        DecArray2: array[1000] of Decimal;
        I2, J2, Count3 : Integer;
        Values3: List of [Decimal];
        TopTwo3: List of [Decimal];
        DecArray3: array[1000] of Decimal;
        I3, J3, Count4 : Integer;
        Temp: Decimal;
        FinalValue: Decimal;
        Temp1: Decimal;
        Temp2: Decimal;
        Temp3: Decimal;
        Temp4: Decimal;
        MaxVlaue: Decimal;
        NetPLSenPrice1A: Decimal;
        NetPLSenPrice1B: Decimal;
        NetPLSenPrice2A: Decimal;
        NetPLSenPrice2B: Decimal;
        NetPLscenario3: Decimal;
        NetPLscenario4: Decimal;
        LargeValue: Decimal;
        LargeValue1: Decimal;
        LargeValue2: Decimal;
        LargeValue3: Decimal;
        LargeValue4: Decimal;
        LargeValue5: Decimal;
        LargeValue6: Decimal;
        LargeValue7: Decimal;
        LargeValue8: Decimal;

        NetLLossenPrice1A: Decimal;
        NetLLossSenPrice1B: Decimal;
        NetLLossSenPrice2A: Decimal;
        NetLLossSenPrice2B: Decimal;
        NetLLossscenario3: Decimal;
        NetLLossscenario4: Decimal;
        TotalNetLLossenPrice1A: Decimal;
        TotalNetLLossSenPrice1B: Decimal;
        TotalNetLLossSenPrice2A: Decimal;
        TotalNetLLossSenPrice2B: Decimal;
        TotalNetLLossscenario3: Decimal;
        TotalNetLLossscenario4: Decimal;
        scenario5: Decimal;
        scenario6: Decimal;
        FundsPayInPreDay: Decimal;
        FundsPayOutPreDay: Decimal;
        finalLossSenario1: Decimal;
        finalLossSenario2: Decimal;
        finalLossSenario3: Decimal;
        finalLossSenario4: Decimal;

    trigger OnPreReport()
    var
        myInt: Integer;

    begin
        ExcelBuffer.DELETEALL;
        // Clear(PeriodText);
        // Clear(PeriodText1);
        // PeriodText := Format(FromDate);
        // PeriodText1 := Format(ToDate);

        // companyinf.Reset();
        // if companyinf.FindFirst() then
        //     CompName := companyinf.Name;

        MakeExcelInfo();
        MakeExcelHeader();




    end;

    trigger OnPostReport()
    var
        myInt: Integer;
    begin
        CreateExcel();
    end;

    procedure MakeexcelInfo()
    var
        myInt: Integer;
    begin
        ExcelBuffer.SetUseInfoSheet;
        ExcelBuffer.AddInfoColumn(COMPANYNAME, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddInfoColumn(USERID, FALSE, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddInfoColumn(Today, false, TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        ExcelBuffer.NewRow();
        ExcelBuffer.ClearNewRow;
    end;

    procedure MakeExcelHeader()
    var
        myInt: Integer;
    begin
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('CM Final Loss On Scenario', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Number);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
        // ExcelBuffer.NewRow();
        // ExcelBuffer.AddColumn(PeriodText, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        // ExcelBuffer.AddColumn(PeriodText1, FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Date);
        ExcelBuffer.NewRow();
        ExcelBuffer.AddColumn('Details CM Final Loss On Scenario', FALSE, '', TRUE, FALSE, FALSE, '', ExcelBuffer."Cell Type"::Text);
    end;



    procedure CreateExcel()
    var
        myInt: Integer;
    begin
        ExcelBuffer.CreateNewExcelBookY('', 'CM Final Loss On Scenario', 'CM Final Loss On Scenario', CompanyName, UserId);
    end;


    procedure Logarithm(Number: Decimal; Base: Decimal): Decimal;
    var
        NaturalLogNumber: Decimal;
        NaturalLogBase: Decimal;
    begin
        if Number <= 0 then
            Error('The number must be greater than 0.');

        if Base <= 0 then
            Error('The base must be greater than 0.');

        // Calculate natural logarithms using an approximation method
        NaturalLogNumber := CalculateNaturalLog(Number);
        NaturalLogBase := CalculateNaturalLog(Base);

        // Logarithm of Number with the specified base
        exit(NaturalLogNumber / NaturalLogBase);
    end;

    procedure CalculateNaturalLog(X: Decimal): Decimal;
    var
        PreviousValue: Decimal;
        CurrentValue: Decimal;
        Difference: Decimal;
        Iterations: Integer;
        MaxIterations: Integer;
    begin
        // Newton's method for approximating natural log
        PreviousValue := 0;
        CurrentValue := X - 1; // Start approximation from (X - 1)
        Difference := CurrentValue - PreviousValue;
        Iterations := 0;
        MaxIterations := 1000; // Set a maximum number of iterations

        while (ABS(Difference) > 0.000001) and (Iterations < MaxIterations) do begin
            PreviousValue := CurrentValue;
            CurrentValue := PreviousValue - ((Exp(PreviousValue) - X) / Exp(PreviousValue)); // Newton's method step
            Difference := CurrentValue - PreviousValue;
            Iterations += 1;
        end;

        exit(CurrentValue);
    end;



    procedure CalculateLnOfTwo(): Decimal
    var
        ln2Approximation: Decimal;
        n: Integer;
        term, x : Decimal;
    begin
        ln2Approximation := 0;
        x := (2 - 1); // for ln(2), x = 1 (because ln(1+x) = ln(2) when x = 1)

        // Calculate using a simple Taylor series expansion for ln(1+x)
        for n := 1 to 100 do begin
            term := Power(x, n) / n; // Calculate each term of the series
            if n mod 2 = 0 then
                ln2Approximation -= term // Subtract even terms
            else
                ln2Approximation += term; // Add odd terms
        end;

        // Message('Approximated natural logarithm of 2: %1', ln2Approximation);
        exit(ln2Approximation);
    end;


    procedure CalculateLn(x: Decimal): Decimal
    var
        lnApproximation: Decimal;
        n: Integer;
        term, y : Decimal;
    begin
        if x <= 0 then begin
            //   Error('Natural logarithm is undefined for non-positive numbers.');
        end;

        lnApproximation := 0;
        y := (x - 1) / (x + 1); // Change of variable for faster convergence (y = (x-1)/(x+1))

        // Calculate using a Taylor series expansion for ln(x)
        n := 1;
        while n <= 100 do begin
            term := Power(y, n) / n; // Calculate each term of the series for odd n
            lnApproximation += 2 * term; // Multiply by 2 due to change of variable
            n := n + 2; // Increment n by 2 to consider only odd numbers
        end;

        //Message('Approximated natural logarithm of %1: %2', x, lnApproximation);
        exit(lnApproximation);
    end;

    procedure InsertImageInExcel()
    var
        ImageStream: InStream;
        FilePath: Text;
        FileManagement: Codeunit "File Management";


    begin
        // Load your image from a file or Blob into a stream
        // FilePath := 'C:\Images\Logo.png';
        // if FileManagement.BLOBImportWithFilter(FilePath, ImageStream) then begin
        // Handle stream to load into Excel using external library or extension
        // Use EPPlus or OpenXML library to work with Excel files directly.
        // end;
    end;

    procedure NORMSDIST(x: Decimal): Decimal;
    var
        pi: Decimal;
        erfResult: Decimal;
    begin
        // Constant values
        pi := 3.14159265359;

        // Approximation of the cumulative normal distribution using the error function (erf)
        erfResult := ERF(x / Power(2, 1 / 2));
        //Power(2, 1 / 2)

        // Calculate the NORMSDIST result
        exit(0.5 * (1 + erfResult));
    end;

    procedure ERF(x: Decimal): Decimal;
    var
        t: Decimal;
        z: Decimal;
        tau: Decimal;
    begin
        // Using an approximation formula for the error function (erf)
        t := 1 / (1 + 0.3275911 * ABS(x));
        z := t * (0.254829592 - t * (0.284496736 - t * (1.421413741 - t * (1.453152027 - t * 1.061405429))));

        tau := 1 - z * EXP(-x * x);
        if x >= 0 then
            exit(tau)
        else
            exit(-tau);
    end;

    procedure Exp(X: Decimal): Decimal;
    var
        Result: Decimal;
        Term: Decimal;
        i: Integer;
    begin
        // Exponential series approximation: e^x = 1 + x + x^2/2! + x^3/3! + ...
        Result := 1;
        Term := 1;
        // for i := 1 to 100 do begin
        //     Term := (Term * X) / i;
        //     Result := Result + Term;
        // end;
        for i := 1 to 100 do begin
            Term := (Term * X) / i;
            if ABS(Term) < 0.000000000001 then // 10^-10 or your precision threshold
                break;
            Result := Result + Term;
        end;

        exit(Result);
    end;

    procedure MaxValue(a: Decimal; b: Decimal): Decimal;
    begin
        if a > b then
            exit(a)
        else
            exit(b);
    end;

    procedure CalculateDifference(CodeType: Text[1]; Qty: Decimal; ActualValue: Decimal; ExpectedValue: Decimal): Decimal
    var
        Difference: Decimal;
    begin
        // Calculate the difference between actual and expected
        Difference := ActualValue - ExpectedValue;

        // Apply the same logic as the Excel formula
        if ((CodeType = 'C') or (CodeType = 'P')) and (Qty > 0) and (Difference < 0) then
            exit(0) // All conditions are met, return 0
        else
            exit(Difference); // Otherwise return the actual difference
    end;

    local procedure CalculateScenarioValue(ClientCode: Code[20]; SeriesId: Decimal; MarketLot: Decimal): Decimal
    var
        Result: Integer;
    begin
        if ClientCode = 'OWN' then
            Result := SeriesId
        else
            Result := SeriesId + MarketLot;

        exit(Result);
    end;

    local procedure GetAdjustedProfitLoss(Value: Decimal): Decimal
    begin
        if Value >= 0 then
            exit(0)
        else
            exit(Value);
    end;

    procedure CalculateMaxValue(
        FundsPayInPreDay: Decimal;
        FundsPayOutPreDay: Decimal;
        FundsPayInAtEODPrice: Decimal;
        FundsPayOutAtEODPrice: Decimal;
        AdditionalIn1: Decimal;
        AdditionalIn2: Decimal;
        SomeLiability: Decimal
    ): Decimal
    var
        Value1: Decimal;
        Value2: Decimal;
    begin
        Value1 := FundsPayInPreDay - FundsPayOutPreDay + FundsPayInAtEODPrice - FundsPayOutAtEODPrice + AdditionalIn1 - SomeLiability;
        Value2 := FundsPayInPreDay - FundsPayOutPreDay + FundsPayInAtEODPrice - FundsPayOutAtEODPrice + AdditionalIn2 - SomeLiability;

        //  exit(Max(Value1, Value2));
        if Value1 > Value2 then
            exit(Value1)
        else
            exit(Value2);
    end;

    procedure CalculateNetAmount(
      FundsPayInPreDay: Decimal;
      FundsPayOutPreDay: Decimal;
      FundsPayInAtEODPrice: Decimal;
      FundsPayOutAtEODPrice: Decimal;
      AdjustmentAmount: Decimal;
      SomeLiability: Decimal
  ): Decimal
    begin
        exit(FundsPayInPreDay - FundsPayOutPreDay +
             FundsPayInAtEODPrice - FundsPayOutAtEODPrice +
             AdjustmentAmount - SomeLiability);
    end;

    // procedure GetMaxValue(TableId: Integer; FieldNo: Integer): Decimal
    // var
    //     RecRef: RecordRef;
    //     FieldRef: FieldRef;
    //     MaxValue: Decimal;
    //     CurrValue: Decimal;
    // begin
    //     MaxValue := -999999999999.0;
    //     RecRef.Open(TableId);

    //     if RecRef.FindSet() then begin
    //         repeat
    //             FieldRef := RecRef.Field(FieldNo);
    //             CurrValue := FieldRef.Value();
    //             if CurrValue > MaxValue then
    //                 MaxValue := CurrValue;
    //         until RecRef.Next() = 0;
    //     end;

    //     RecRef.Close();
    //     exit(MaxValue);
    // end;
    procedure GetTopTwoFromTable(): List of [Decimal]
    var
        JnlLine: Record "Gen. Journal Line";
        Values: List of [Decimal];
        TopTwo: List of [Decimal];
        DecArray: array[1000] of Decimal;
        I, J, Count : Integer;
        Temp: Decimal;
    begin
        //Values := List of [Decimal]();

        // Collect all Amount values into list
        if JnlLine.FindSet() then begin
            repeat
                Values.Add(JnlLine.Amount);
            until JnlLine.Next() = 0;
        end;

        Count := Values.Count();
        if Count < 2 then
            Error('Not enough values in data.');

        // Copy to array for sorting
        I := 1;
        foreach Temp in Values do begin
            DecArray[I] := Temp;
            I += 1;
        end;

        // Sort descending
        for I := 1 to Count - 1 do
            for J := I + 1 to Count do
                if DecArray[J] > DecArray[I] then begin
                    Temp := DecArray[I];
                    DecArray[I] := DecArray[J];
                    DecArray[J] := Temp;
                end;

        // Return top 2
        //TopTwo := List of [Decimal]();
        TopTwo.Add(DecArray[1]);
        TopTwo.Add(DecArray[2]);

        exit(TopTwo);
    end;

    procedure GetMaxOfFour(R: Decimal; S: Decimal; T: Decimal; U: Decimal): Decimal
    var
        MaxValue: Decimal;
    begin
        MaxValue := R;

        if S > MaxValue then
            MaxValue := S;
        if T > MaxValue then
            MaxValue := T;
        if U > MaxValue then
            MaxValue := U;

        exit(MaxValue);
    end;

}