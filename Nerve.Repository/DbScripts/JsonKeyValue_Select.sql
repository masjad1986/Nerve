SELECT DISTINCT  t.Variables, T.[Json]
FROM
(
	SELECT 'public const string '+REPLACE(MenuName,' ','') +'="'+LOWER(REPLACE(MenuName,' ','-'))+'";' AS [Variables],
	LOWER(REPLACE(MenuName,' ','-')) +': "'+MenuName+'",' AS [Json] FROM [HAMI_SCP].dbo.WEB_MENUMASTER
) T
ORDER BY T.Json