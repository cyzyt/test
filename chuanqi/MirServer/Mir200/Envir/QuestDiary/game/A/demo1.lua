demo1 = {}
demo1.ID = 1000

local _varn_btns = {"S$H_·çÖ®ÎÆÕÂ°´Å¥Í¼", "S$H_Ë®Ö®ÎÆÕÂ°´Å¥Í¼", "S$H_»ðÖ®ÎÆÕÂ°´Å¥Í¼", "S$H_»ìãçÎÆÕÂ°´Å¥Í¼"}

local function _openui(actor, select)
    select = select or 1
    for i,var_name in ipairs(_varn_btns) do
        local respath = i==select and "public/1900000662.png" or "public/1900000663.png"
        setplaydef(actor, var_name, respath)
    end

    powerrate(actor, 124, 10000)

    local saystr = parsetext([[
        <Img|x=0|y=0|width=<$SCREENWIDTH>|height=<$SCREENHEIGHT>|scale9r=12|scale9t=12|show=4|bg=1|img=custom/demo1/bg_main_6.png|scale9b=12|scale9l=1|layerid=1000>
        <Layout|children={texiao,1,2,3,4,5,6,7,8,9,10,11,12}|a=4|percentx=50|percenty=50|width=792|height=538>
        <Effect|id=texiao|x=27.0|y=13.0|effectid=23|act=0|dir=5|speed=1|effecttype=0|scale=1>
        <Img|id=1|esc=1|img=custom/demo1/mianban00001.png>
        <Layout|id=2|x=759.5|y=0.5|width=80|height=80|link=@exit>
        <Button|id=3|x=786.6|y=19.0|pimg=public/1900000511.png|nimg=public/1900000510.png|link=@exit>
        <Img|id=4|x=36.0|y=69.0|img=custom/demo1/wanneng_01.png|esc=0>
        <Text|id=5|x=47.0|y=28.0|outlinecolor=0|outline=2|size=20|color=103|text=<$PKPOWER>>
        <Button|id=6|x=39.0|y=75.0|outline=1|outlinecolor=0|color=103|size=18|nimg=<$str(S$H_·çÖ®ÎÆÕÂ°´Å¥Í¼)>|pimg=<$str(S$H_·çÖ®ÎÆÕÂ°´Å¥Í¼)>|children={<$str(S$H_·çÖ®ÎÆÕÂºìµãid)>}|text=·çÖ®ÎÆÕÂ|link=@on1_select,1>
        <Button|id=7|x=39.0|y=115.0|outline=1|outlinecolor=0|color=103|size=18|nimg=<$str(S$H_Ë®Ö®ÎÆÕÂ°´Å¥Í¼)>|pimg=<$str(S$H_Ë®Ö®ÎÆÕÂ°´Å¥Í¼)>|children={<$str(S$H_Ë®Ö®ÎÆÕÂºìµãid)>}|text=Ë®Ö®ÎÆÕÂ|link=@on1_select,2>
        <Button|id=8|x=38.0|y=155.0|outlinecolor=0|outline=1|nimg=<$str(S$H_»ðÖ®ÎÆÕÂ°´Å¥Í¼)>|pimg=<$str(S$H_»ðÖ®ÎÆÕÂ°´Å¥Í¼)>|size=18|color=103|children={<$str(S$H_»ðÖ®ÎÆÕÂºìµãid)>}|text=»ðÖ®ÎÆÕÂ|link=@on1_select,3>
        <Button|id=9|x=38.0|y=195.0|outlinecolor=0|outline=1|nimg=<$str(S$H_»ìãçÎÆÕÂ°´Å¥Í¼)>|pimg=<$str(S$H_»ìãçÎÆÕÂ°´Å¥Í¼)>|size=18|color=103|children={<$str(S$H_»ìãçÎÆÕÂºìµãid)>}|text=»ìãçÎÆÕÂ|link=@on1_select,4>
        <ListView|id=11|x=159.0|y=70.0|width=608|height=443|rotate=0|bounce=1|direction=1|margin=5|children=<$str(S$H_listview_children)>>
    ]], actor)
    LOGWrite(saystr)
    say(actor, saystr)
end

function on1_select(actor, select)
    _openui(actor, tonumber(select))
end

demo1.openui = _openui

return demo1