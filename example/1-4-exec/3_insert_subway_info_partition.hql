INSERT OVERWRITE TABLE hive_edu.SUBWAY_INFO_PARTITION
PARTITION (P_USE_MON,P_LINE_NUM)
SELECT
SUB_STA_NM              ,
FOUR_RIDE_NUM           ,
FOUR_ALIGHT_NUM         ,
FIVE_RIDE_NUM           ,
FIVE_ALIGHT_NUM         ,
SIX_RIDE_NUM            ,
SIX_ALIGHT_NUM          ,
SEVEN_RIDE_NUM          ,
SEVEN_ALIGHT_NUM        ,
EIGHT_RIDE_NUM          ,
EIGHT_ALIGHT_NUM        ,
NINE_RIDE_NUM           ,
NINE_ALIGHT_NUM         ,
TEN_RIDE_NUM            ,
TEN_ALIGHT_NUM          ,
ELEVEN_RIDE_NUM         ,
ELEVEN_ALIGHT_NUM       ,
TWELVE_RIDE_NUM         ,
TWELVE_ALIGHT_NUM       ,
THIRTEEN_RIDE_NUM       ,
THIRTEEN_ALIGHT_NUM     ,
FOURTEEN_RIDE_NUM       ,
FOURTEEN_ALIGHT_NUM     ,
FIFTEEN_RIDE_NUM        ,
FIFTEEN_ALIGHT_NUM      ,
SIXTEEN_RIDE_NUM        ,
SIXTEEN_ALIGHT_NUM      ,
SEVENTEEN_RIDE_NUM      ,
SEVENTEEN_ALIGHT_NUM    ,
EIGHTEEN_RIDE_NUM       ,
EIGHTEEN_ALIGHT_NUM     ,
NINETEEN_RIDE_NUM       ,
NINETEEN_ALIGHT_NUM     ,
TWENTY_RIDE_NUM         ,
TWENTY_ALIGHT_NUM       ,
TWENTY_ONE_RIDE_NUM     ,
TWENTY_ONE_ALIGHT_NUM   ,
TWENTY_TWO_RIDE_NUM     ,
TWENTY_TWO_ALIGHT_NUM   ,
TWENTY_THREE_RIDE_NUM   ,
TWENTY_THREE_ALIGHT_NUM ,
MIDNIGHT_RIDE_NUM       ,
MIDNIGHT_ALIGHT_NUM     ,
ONE_RIDE_NUM            ,
ONE_ALIGHT_NUM          ,
TWO_RIDE_NUM            ,
TWO_ALIGHT_NUM          ,
THREE_RIDE_NUM          ,
THREE_ALIGHT_NUM        ,
WORK_DT                 ,
USE_MON                 ,
LINE_NUM                
FROM hive_edu.SUBWAY_INFO;