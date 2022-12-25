/* 既存のコード体系を新しい体系に変換して集計 */
CREATE TABLE PopTbl
(pref_name VARCHAR(32) PRIMARY KEY,
 population INTEGER NOT NULL);

INSERT INTO PopTbl VALUES('徳島', 100);
INSERT INTO PopTbl VALUES('香川', 200);
INSERT INTO PopTbl VALUES('愛媛', 150);
INSERT INTO PopTbl VALUES('高知', 200);
INSERT INTO PopTbl VALUES('福岡', 300);
INSERT INTO PopTbl VALUES('佐賀', 100);
INSERT INTO PopTbl VALUES('長崎', 200);
INSERT INTO PopTbl VALUES('東京', 400);
INSERT INTO PopTbl VALUES('群馬', 50);

/* 県コードを地方コードに再分類する(p.11) */
SELECT CASE pref_name
             WHEN '徳島' THEN '四国'
             WHEN '香川' THEN '四国'
             WHEN '愛媛' THEN '四国'
             WHEN '高知' THEN '四国'
             WHEN '福岡' THEN '九州'
             WHEN '佐賀' THEN '九州'
             WHEN '長崎' THEN '九州'
             ELSE 'その他' END AS district,
       SUM(population)
  FROM PopTbl
 GROUP BY CASE pref_name
             WHEN '徳島' THEN '四国'
             WHEN '香川' THEN '四国'
             WHEN '愛媛' THEN '四国'
             WHEN '高知' THEN '四国'
             WHEN '福岡' THEN '九州'
             WHEN '佐賀' THEN '九州'
             WHEN '長崎' THEN '九州'
             ELSE 'その他' END;

