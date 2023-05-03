Sub Scanner()

    sPreviousSalle = ""
  ' Make sure to change de défault Line.
    iDefaultLigne = 5
    For i = 2 To 1000
        ' Make sure to change de name of the sheets and the range.
        sSalle = Sheets("Data").Range("A" & i).Value
        sTache = Sheets("Data").Range("B" & i).Value
        
        If sSalle = "" Then
            Exit For
        End If
        
        If sSalle <> sPreviousSalle Then
            
            If sPreviousSalle <> "" Then
                
                data_to_text_file (sPreviousSalle)
                   ' WARNING ! If you need to scan more than 50 line, change the value "50" to your value
            Range("K" & iDefaultLigne & ":L" & iDefaultLigne + 50).ClearContents
            End If
            
            sPreviousSalle = sSalle
            iDestLine = iDefaultLigne
        Else
            iDestLine = iDestLine + 1
        End If
        
            Sheets("Main").Range("k" & iDestLine).Value = sSalle
            Sheets("Main").Range("l" & iDestLine).Value = sTache

       Next i
    ' ---------------------- Attention, I use in the rest of the code this function ( https://github.com/Miphonya/random_code/vba/data2textfile.vba ) But you can delete what is underneath if you do not need it ----------------------
       data_to_text_file (sPreviousSalle)
    ' ----------------------      ----------------------      ----------------------
    MsgBox ("hey, I'm stopped to the line" & i)
    

End Sub
