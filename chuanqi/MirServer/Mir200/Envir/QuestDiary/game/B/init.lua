local temp = require("Envir/QuestDiary/cfgcsv/cfg_jinengshanghai.lua")
cfg_jinengshanghai = {}
for i, var in pairs(temp) do
    cfg_jinengshanghai[var.weizhi] = cfg_jinengshanghai[var.weizhi] or {}
    cfg_jinengshanghai[var.weizhi][i] = var
end

cfg_gameactive                      = require("Envir/QuestDiary/cfgcsv/cfg_gameactive.lua")         --????
cfg_duplicate                       = require("Envir/QuestDiary/cfgcsv/cfg_duplicate.lua")          --????2
cfg_fuben_gen                       = require("Envir/QuestDiary/cfgcsv/cfg_fuben_gen.lua")          --??/????????
cfg_announce                        = require("Envir/QuestDiary/cfgcsv/cfg_announce.lua")           --?????
cfg_mail                            = require("Envir/QuestDiary/cfgcsv/cfg_mail.lua")
cfg_ntgm                            = require("Envir/QuestDiary/cfgcsv/cfg_ntgm.lua")
cfg_compound                        = require("Envir/QuestDiary/cfgcsv/cfg_compound.lua")
cfg_mystery_store                   = require("Envir/QuestDiary/cfgcsv/cfg_mystery_store.lua")
cfg_fenjie                          = require("Envir/QuestDiary/cfgcsv/cfg_fenjie.lua")
cfg_baoxiang                        = require("Envir/QuestDiary/cfgcsv/cfg_baoxiang.lua")
cfg_baowu                           = require("Envir/QuestDiary/cfgcsv/cfg_baowu.lua")
cfg_huishou                         = require("Envir/QuestDiary/cfgcsv/cfg_huishou_zhuangbei.lua")
cfg_dld_jifen                       = require("Envir/QuestDiary/cfgcsv/cfg_daluandou_jifen.lua")
cfg_dld_rewards                     = require("Envir/QuestDiary/cfgcsv/cfg_daluandou_rewards.lua")
cfg_vip                             = require("Envir/QuestDiary/cfgcsv/cfg_vip.lua")
cfg_qianghua                        = require("Envir/QuestDiary/cfgcsv/cfg_qianghua.lua")
cfg_item_hyperlink                  = require("Envir/QuestDiary/cfgcsv/cfg_item_hyperlink.lua")
cfg_xiuxian                         = require("Envir/QuestDiary/cfgcsv/cfg_xiuxian.lua")
cfg_goals                           = require("Envir/QuestDiary/cfgcsv/cfg_goals.lua")
cfg_qiandao                         = require("Envir/QuestDiary/cfgcsv/cfg_qiandao.lua")

require("Envir/QuestDiary/game/B/JiangHuMingWang.lua")
require("Envir/QuestDiary/game/B/QuickAccess.lua")
require("Envir/QuestDiary/game/B/Forgingstar.lua")
require("Envir/QuestDiary/game/B/Ronglu.lua")
require("Envir/QuestDiary/game/B/EquipForge.lua")
require("Envir/QuestDiary/game/B/SL_Fenjie.lua")
require("Envir/QuestDiary/game/B/MysteryStore.lua")
require("Envir/QuestDiary/game/B/Hecheng.lua")
--require("Envir/QuestDiary/game/B/HechengNPC.lua")
require("Envir/QuestDiary/game/B/HechengDuanzao.lua")
require("Envir/QuestDiary/game/B/HechengJinjie.lua")
require("Envir/QuestDiary/game/B/HechengRonghe.lua")
require("Envir/QuestDiary/game/B/Nitiangaiming.lua")
require("Envir/QuestDiary/game/B/Baowu.lua")
require("Envir/QuestDiary/game/B/Recycle.lua")
require("Envir/QuestDiary/game/B/ActivitySystem.lua")
require("Envir/QuestDiary/game/B/Playyydz.lua")
require("Envir/QuestDiary/game/B/Playdld.lua")
require("Envir/QuestDiary/game/B/SevenDaySignin.lua")