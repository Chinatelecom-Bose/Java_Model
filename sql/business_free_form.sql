-- ===============================================
-- 插入 data_drill_info 表示例数据
-- ===============================================

-- 插入公免系统异常汇总报表数据（基于数据库实际数据）
INSERT INTO "public"."data_drill_info" (
    "report_name", 
    "uuid", 
    "status", 
    "description", 
    "created_time", 
    "updated_time", 
    "created_id", 
    "updated_id"
) VALUES (
    '公免系统异常汇总',
    NULL,
    '0',
    '公免业务系统异常数据汇总报表，包含数量异常、预到期、已到期等异常情况',
    CURRENT_TIMESTAMP,
    CURRENT_TIMESTAMP,
    1,
    NULL
)
ON CONFLICT ("report_name") DO UPDATE SET
    "status" = EXCLUDED.status,
    "description" = EXCLUDED.description,
    "updated_time" = CURRENT_TIMESTAMP,
    "updated_id" = EXCLUDED.updated_id;




-- ===============================================
-- 插入 data_drill_node 表节点数据
-- ===============================================

-- 插入公务免费预警汇总节点（父节点）
INSERT INTO "public"."data_drill_node" (
    "info_id", "parent_id", "node_name", "sql_text", "link_field", "param_name", 
    "id", "uuid", "status", "description", "created_time", "updated_time", "created_id", "updated_id", "pass_field"
) VALUES (
    14, NULL, '公务免费预警汇总', 
    
    'SELECT
  au.经营单位 AS 经营单位,
  COALESCE(qa.数量异常, 0) AS 数量异常,
  COALESCE(es.预到期业务单数量, 0) AS 预到期业务单数量,
  COALESCE(e.已到期业务单数量, 0) AS 已到期业务单数量,
  CAST(
    (
      COALESCE(qa.数量异常, 0) + COALESCE(es.预到期业务单数量, 0) + COALESCE(e.已到期业务单数量, 0)
    ) AS INTEGER
  ) AS 异常总数
FROM
  (
    SELECT DISTINCT
      经营单位
    FROM
      business_free
    WHERE
      经营单位 IS NOT NULL
      AND 经营单位 != ''
  ) au
  LEFT JOIN (
    SELECT
      a.经营单位,
      COUNT(DISTINCT a.公免业务单编号) AS 数量异常
    FROM
      (
        SELECT DISTINCT
          经营单位,
          公免业务单编号,
          CASE
            WHEN 产品数量 IS NULL
            OR TRIM(产品数量) = '' THEN '0'
            ELSE 产品数量
          END AS 产品数量
        FROM
          business_free
      ) a
      LEFT JOIN (
        SELECT
          经营单位,
          公免业务单编号,
          COUNT("用户ID") AS nums
        FROM
          business_free
        GROUP BY
          经营单位,
          公免业务单编号
      ) b ON a.公免业务单编号 = b.公免业务单编号
    WHERE
      nums > CAST(a.产品数量 AS INTEGER)
    GROUP BY
      a.经营单位
  ) qa ON au.经营单位 = qa.经营单位
  LEFT JOIN (
    SELECT
      经营单位,
      COUNT(DISTINCT 公免业务单编号) AS 预到期业务单数量
    FROM
      (
        SELECT
          公免业务单编号,
          经营单位,
          ROW_NUMBER() OVER (
            PARTITION BY
              公免业务单编号
            ORDER BY
              (DATE (到期时间) - CURRENT_DATE) ASC
          ) as rn
        FROM
          business_free
        WHERE
          到期时间 IS NOT NULL
          AND 到期时间 != ''
          AND DATE (到期时间) >= CURRENT_DATE
          AND DATE (到期时间) <= CURRENT_DATE + INTERVAL '60 days'
      ) ranked
    WHERE
      rn = 1
    GROUP BY
      经营单位
  ) es ON au.经营单位 = es.经营单位
  LEFT JOIN (
    SELECT
      经营单位,
      COUNT(DISTINCT 公免业务单编号) AS 已到期业务单数量
    FROM
      (
        SELECT
          公免业务单编号,
          经营单位,
          ROW_NUMBER() OVER (
            PARTITION BY
              公免业务单编号
            ORDER BY
              (CURRENT_DATE - DATE (到期时间)) DESC
          ) as rn
        FROM
          business_free
        WHERE
          到期时间 IS NOT NULL
          AND 到期时间 != ''
          AND DATE (到期时间) < CURRENT_DATE
      ) ranked
    WHERE
      rn = 1
    GROUP BY
      经营单位
  ) e ON au.经营单位 = e.经营单位
ORDER BY
  (
    COALESCE(qa.数量异常, 0) + COALESCE(es.预到期业务单数量, 0) + COALESCE(e.已到期业务单数量, 0)
  ) DESC,
  au.经营单位', 

    '', '',
    38, NULL, '0', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, NULL, NULL
)
ON CONFLICT ("id") DO UPDATE SET
    "node_name" = EXCLUDED.node_name,
    "sql_text" = EXCLUDED.sql_text,
    "link_field" = EXCLUDED.link_field,
    "param_name" = EXCLUDED.param_name,
    "uuid" = EXCLUDED.uuid,
    "status" = EXCLUDED.status,
    "description" = EXCLUDED.description,
    "updated_time" = CURRENT_TIMESTAMP,
    "updated_id" = EXCLUDED.updated_id,
    "pass_field" = EXCLUDED.pass_field;

-- 插入数量异常工单节点（子节点）
INSERT INTO "public"."data_drill_node" (
    "info_id", "parent_id", "node_name", "sql_text", "link_field", "param_name", 
    "id", "uuid", "status", "description", "created_time", "updated_time", "created_id", "updated_id", "pass_field"
) VALUES (
    14, 38, '数量异常工单', 

    'SELECT
  公免业务单编号,
  经营单位,
  发单人,
  产品数量,
  "用户ID" 数量
FROM
  (
    SELECT DISTINCT
      经营单位,
      公免业务单编号,
      发单人,
      CASE
        WHEN 产品数量 IS NULL
        OR TRIM(产品数量) = '' THEN '0'
        ELSE 产品数量
      END AS 产品数量
    FROM
      business_free
  ) a
  LEFT JOIN (
    SELECT
      经营单位,
      公免业务单编号,
      COUNT("用户ID") AS "用户ID" 数量
    FROM
      business_free
    GROUP BY
      经营单位,
      公免业务单编号
  ) b ON a.公免业务单编号 = b.公免业务单编号
WHERE
  b."用户ID" 数量 > CAST(a.产品数量 AS INTEGER)
  AND a.经营单位 =:经营单位
  AND (
:发单人 IS NULL
    OR a.发单人 LIKE '%' ||:发单人 || '%'
  )
ORDER BY
  b."用户ID" 数量 DESC,
  a.经营单位',

    '数量异常', '经营单位',
    45, NULL, '0', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, NULL, '经营单位'
)
ON CONFLICT ("id") DO UPDATE SET
    "node_name" = EXCLUDED.node_name,
    "sql_text" = EXCLUDED.sql_text,
    "link_field" = EXCLUDED.link_field,
    "param_name" = EXCLUDED.param_name,
    "uuid" = EXCLUDED.uuid,
    "status" = EXCLUDED.status,
    "description" = EXCLUDED.description,
    "updated_time" = CURRENT_TIMESTAMP,
    "updated_id" = EXCLUDED.updated_id,
    "pass_field" = EXCLUDED.pass_field;

-- 插入预到期工单节点（子节点）
INSERT INTO "public"."data_drill_node" (
    "info_id", "parent_id", "node_name", "sql_text", "link_field", "param_name", 
    "id", "uuid", "status", "description", "created_time", "updated_time", "created_id", "updated_id", "pass_field"
) VALUES (
    14, 38, '预到期工单', 

    'SELECT
  公免业务单编号,
  经营单位,
  电话号码,
  发单人,
  产品数量,
  到期时间,
  (DATE (到期时间) - CURRENT_DATE) AS 剩余天数
FROM
  (
    SELECT
      公免业务单编号,
      经营单位,
      电话号码,
      发单人,
      产品数量,
      到期时间,
      ROW_NUMBER() OVER (
        PARTITION BY
          公免业务单编号
        ORDER BY
          (DATE (到期时间) - CURRENT_DATE) ASC
      ) as rn
    FROM
      business_free
    WHERE
      到期时间 IS NOT NULL
      AND 到期时间 != ''
      AND DATE (到期时间) >= CURRENT_DATE
      AND DATE (到期时间) <= CURRENT_DATE + INTERVAL '60 days'
  ) ranked_data
WHERE
  rn = 1
  AND 经营单位 =:经营单位
ORDER BY
  (DATE (到期时间) - CURRENT_DATE) ASC',

    '预到期业务单数量', '经营单位',
    46, NULL, '0', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, NULL, '经营单位'
)
ON CONFLICT ("id") DO UPDATE SET
    "node_name" = EXCLUDED.node_name,
    "sql_text" = EXCLUDED.sql_text,
    "link_field" = EXCLUDED.link_field,
    "param_name" = EXCLUDED.param_name,
    "uuid" = EXCLUDED.uuid,
    "status" = EXCLUDED.status,
    "description" = EXCLUDED.description,
    "updated_time" = CURRENT_TIMESTAMP,
    "updated_id" = EXCLUDED.updated_id,
    "pass_field" = EXCLUDED.pass_field;

-- 插入已到期工单节点（子节点）
INSERT INTO "public"."data_drill_node" (
    "info_id", "parent_id", "node_name", "sql_text", "link_field", "param_name", 
    "id", "uuid", "status", "description", "created_time", "updated_time", "created_id", "updated_id", "pass_field"
) VALUES (
    14, 38, '已到期工单', 

    'SELECT
  公免业务单编号,
  经营单位,
  电话号码,
  发单人,
  产品数量,
  到期时间,
  (CURRENT_DATE - DATE (到期时间)) AS 已过期天数
FROM
  (
    SELECT
      公免业务单编号,
      经营单位,
      电话号码,
      发单人,
      产品数量,
      到期时间,
      ROW_NUMBER() OVER (
        PARTITION BY
          公免业务单编号
        ORDER BY
          (CURRENT_DATE - DATE (到期时间)) DESC
      ) as rn
    FROM
      business_free
    WHERE
      到期时间 IS NOT NULL
      AND 到期时间 != ''
      AND DATE (到期时间) < CURRENT_DATE
  ) ranked_data
WHERE
  rn = 1
  AND 经营单位 =:经营单位
ORDER BY
  (CURRENT_DATE - DATE (到期时间)) DESC',
     
    '已到期业务单数量', '经营单位',
    47, NULL, '0', '', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP, 1, NULL, '经营单位'
)
ON CONFLICT ("id") DO UPDATE SET
    "node_name" = EXCLUDED.node_name,
    "sql_text" = EXCLUDED.sql_text,
    "link_field" = EXCLUDED.link_field,
    "param_name" = EXCLUDED.param_name,
    "uuid" = EXCLUDED.uuid,
    "status" = EXCLUDED.status,
    "description" = EXCLUDED.description,
    "updated_time" = CURRENT_TIMESTAMP,
    "updated_id" = EXCLUDED.updated_id,
    "pass_field" = EXCLUDED.pass_field;