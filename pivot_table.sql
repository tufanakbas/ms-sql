SELECT * from(
SELECT 
CASE MONTH(PolTarihi)
WHEN 1 THEN 'Ocak'
WHEN 2 THEN 'Şubat'
WHEN 3 THEN 'Mart'
WHEN 4 THEN 'Nisan'
WHEN 5 THEN 'Mayıs'
WHEN 6 THEN 'Haziran'
WHEN 7 THEN 'Temmuz'
WHEN 8 THEN 'Ağustos'
WHEN 9 THEN 'Eylül'
WHEN 10 THEN 'Ekim'
WHEN 11 THEN 'Kasım'
WHEN 12 THEN 'Aralık'
END  AS AY,
F.FirmaAd as [Firma Adı], COUNT(*) as [Toplam Operation] FROM Operation O Inner join Firma F on O.fkConsignee=F.pkFirma 
where YEAR(PolTarihi) between YEAR('2021-06-29 15:34:38.080') and YEAR('2021-06-29 15:34:38.080') GROUP BY MONTH(PolTarihi),F.FirmaAd ) as Tablo 
PIVOT(
 SUM([Toplam Operation]) FOR Ay IN([Ocak], [Şubat], [Mart], [Nisan], [Mayıs], [Haziran],
 [Temmuz], [Ağustos], [Eylül], [Ekim], [Kasım], [Aralık])
) PivotTablo
UNION
SELECT * from(
SELECT 
CASE MONTH(Oe.PolTarihi)
WHEN 1 THEN 'Ocak'
WHEN 2 THEN 'Şubat'
WHEN 3 THEN 'Mart'
WHEN 4 THEN 'Nisan'
WHEN 5 THEN 'Mayıs'
WHEN 6 THEN 'Haziran'
WHEN 7 THEN 'Temmuz'
WHEN 8 THEN 'Ağustos'
WHEN 9 THEN 'Eylül'
WHEN 10 THEN 'Ekim'
WHEN 11 THEN 'Kasım'
WHEN 12 THEN 'Aralık'
END  AS AY,
F.FirmaAd as [Firma Adı], COUNT(*) as [Toplam Operation] FROM OperationExport Oe  Inner join Firma F on Oe.fkShipper=F.pkFirma
where YEAR(Oe.PolTarihi) between YEAR('2021-06-29 15:34:38.080') and YEAR('2021-06-29 15:34:38.080') and Oe.fkHouse>0 GROUP BY MONTH(Oe.PolTarihi),F.FirmaAd ) as Tablo 
PIVOT(
 SUM([Toplam Operation]) FOR Ay IN([Ocak], [Şubat], [Mart], [Nisan], [Mayıs], [Haziran],
 [Temmuz], [Ağustos], [Eylül], [Ekim], [Kasım], [Aralık])
) PivotTablo


